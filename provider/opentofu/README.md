# OpenTofu

## Intro

OpenTofu will be used to deploy infrastructure using various virtualization and/or cloud providers.

This folder should contain folders for generics (eg modules) and possibly specific environments.

## Lab Environment

HomeLab will ideally try to use:

- Proxmox/QEMU as the virtualization provider
- Talos OS as the Kubernetes-specific immutable VM image 

## Providers

- Try to use the [BPG/terraform-provider-proxmox](https://github.com/bpg/terraform-provider-proxmox) instead of telegraf
