terraform {
  required_providers {
    proxmox={
      source="Telmate/proxmox"
      version="3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://10.0.0.4:8006/api2/json"
}

resource "proxmox_pool" "talon-kubernetes" {
  poolid = "talon-kubernetes"
  comment = "TalosVM-based Kubernetes Cluster"
}