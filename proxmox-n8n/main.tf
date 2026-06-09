provider "proxmox" {
  endpoint  = "https://10.44.88.170:8006"
  api_token = "root@pam!terraform=a7d1ee64-c49a-4308-8427-f8635237e71d"
  insecure  = true

  ssh {
    agent    = true
    username = "root"

    node {
      name    = "shrek"
      address = "10.44.88.170"
    }
  }
}

resource "proxmox_virtual_environment_file" "n8n_user_data" {
  content_type = "snippets"
  datastore_id = "keystorage"
  node_name    = "shrek"

  source_file {
    path = "${path.module}/cloud-init/user-data.yaml"
  }
}


resource "proxmox_virtual_environment_vm" "n8n" {
  name      = "n8n"
  node_name = "shrek"
  vm_id     = 202

  clone {
    vm_id = 9000
  }

  started = true

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "data"
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
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

