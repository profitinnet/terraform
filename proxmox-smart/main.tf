provider "proxmox" {
  endpoint  = "https://10.44.88.215:8006"
  api_token = "root@pam!terraform=be329872-fb06-4f55-a882-e57de663cf4d"
  insecure  = true

  ssh {
    agent    = true
    username = "root"

    node {
      name    = "smart"
      address = "10.44.88.215"
    }
  }
}

resource "proxmox_virtual_environment_file" "n8n_user_data" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "smart"

  source_file {
    path = "${path.module}/cloud-init/user-data.yaml"
  }
}


resource "proxmox_virtual_environment_vm" "n8n" {
  name      = "n8n"
  node_name = "smart"
  vm_id     = 202

  clone {
    vm_id = 9000
  }

  started = true

  agent {
    enabled = true
  }

  cpu {
    cores = 6
    type  = "host"
  }

  memory {
    dedicated = 8192
  }

  vga {
    type = "std"
  }

  disk {
    datastore_id = "storage"
    interface    = "scsi0"
    size         = 40
  }

  initialization {
    datastore_id      = "local"
    user_data_file_id = proxmox_virtual_environment_file.n8n_user_data.id

    user_account {
      username = "legrey"
      password = "12345678"
    }

    ip_config {
      ipv4 {
        address = "dhcp"
        #address = "10.44.88.205/24"
        #gateway = "10.44.88.190"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

