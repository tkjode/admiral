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
  pm_parallel=1
}

resource "proxmox_pool" "talon-kubernetes" {
  poolid = "talon-kubernetes"
  comment = "TalosVM-based Kubernetes Cluster"
}

resource "proxmox_vm_qemu" "talon-master-0" {
  name = "talon-master-0"
  desc = "One of Three Master Control Plane Nodes"
  memory = 4096
  sockets = 1
  cores = 4
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "control-plane"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:01"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="40G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-master-1" {
  name = "talon-master-1"
  desc = "Two of Three Master Control Plane Nodes"
  memory = 4096
  sockets = 1
  cores = 4
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "control-plane"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:02"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="40G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-master-2" {
  name = "talon-master-2"
  desc = "Three of Three Master Control Plane Nodes"
  memory = 4096
  sockets = 1
  cores = 4
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "control-plane"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:03"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="40G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-0" {
  name = "talon-worker-0"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:10"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-1" {
  name = "talon-worker-1"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:11"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-2" {
  name = "talon-worker-2"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:12"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-3" {
  name = "talon-worker-3"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:13"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-4" {
  name = "talon-worker-4"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:14"
    bridge="vmbr0"
  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}

resource "proxmox_vm_qemu" "talon-worker-5" {
  name = "talon-worker-5"
  desc = "A typical worker bee"
  memory = 16384
  sockets = 1
  cores = 8
  cpu = "x86-64-v2-AES"
  pool = "talon-kubernetes"
  tags = "worker"

  target_node="proxmox"

  network {
    model="virtio"
    macaddr="BC:24:11:04:01:15"
    bridge="vmbr0"

  }

  disks {
    ide {
      ide0 {
        cdrom {
          iso="local:iso/metal-amd64.iso"
        }
      }
    }

    sata {
      sata0 {
        disk {
          size="120G"
          storage="SSD"
          emulatessd=true
          cache="writeback"
          asyncio="threads"
        }
      }
    }
  }
}