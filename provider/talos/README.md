# Talos VM

## Intro

Talos Operating System is a lightweight immutable Linux distribution specifically designed to run Kubernetes and have very low exposure (eg. no SSH) - all activity on VMs is performed via the Talos API using `talosctl`.

## HomeLab

Steps (as I understand them):

- Get Talos ISO Image + any Overlays required (eg. QEmu guest tools)
- Upload them to provider (eg. Proxmox)
- Provision Talos VMs with IPs (OpenTofu will provision using api key to proxmox)
  - Kernel parameters (in cloud init?) provide static IP capability
- Bootstrap control plane nodes by IP using `talosctl` 
- Add workers by IP using `talosctl`

## Tools

Not sure yet.  Simple Ansible Playbooks may work well here to coordinate all required activities.  Or, might use a pipeline.  Haven't decided.

## Commands Used

```bash
  140  curl -sL https://talos.dev/install | sh                      # installs TalosCTL
  141  talosctl                                                     # make sure its in PATH
  237  export TALOSCONFIG="_out/talosconfig"                        # Ideally set this to a static home path not cwd
  238  talosctl config endpoint $CONTROL_PLANE_IP                   # I don't think this worked up front
  239  talosctl config node $CONTROL_PLANE_IP                       # Same
  240  talosctl gen config talon https://$CONTROL_PLANE_IP:6443 --output-dir _out        # generated conf sets for cplane+worker yamls
  241  talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml     # Pushes conf file - but had problems with scsi disk
  242  talosctl disks --insecure --nodes $CONTROL_PLANE_IP   # No SCSI
  246  talosctl disks --insecure --nodes $CONTROL_PLANE_IP   # Switched to SATA, all good now
  247  talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml   # First master configured
  249  talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml   # Second master configured
  251  talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml   # Third master configured
  253  talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml                # First worker configured 
  256  export WORKER_IP=10.0.0.181 && talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml # Streamlined single cmd, walked each worker
  257  export WORKER_IP=10.0.0.182 && talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml #...
  258  export WORKER_IP=10.0.0.183 && talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml #...
  259  export WORKER_IP=10.0.0.184 && talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml #...
  260  export WORKER_IP=10.0.0.185 && talosctl apply-config --insecure --nodes $WORKER_IP --file _out/worker.yaml #...
  261  export TALOSCONFIG="_out/talosconfig"   # Superfluous
  262  talosctl config endpoint 10.0.0.166   # Now this worked as it could reach a working master node
  263  talosctl config node 10.0.0.166       # Same
  264  talosctl bootstrap                # Fires up etcd and really gets things cooking
  265  talosctl kubeconfig .             # Grab the admin kubeconfig, chuck it in ~/.kube/config and kubectl works.
```