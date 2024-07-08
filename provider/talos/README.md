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