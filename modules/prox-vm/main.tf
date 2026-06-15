resource "proxmox_virtual_environment_file" "this" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.vm_node

  source_file {
    path = var.cloud_init_path
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  name      = var.vm_name
  node_name = var.vm_node
  vm_id     = var.vm_id

  clone {
    vm_id = 9000
  }

  started = true

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_cpu_cores
    type  = "host"
  }

  memory {
    dedicated = var.vm_memory
  }

  vga {
    type = "std"
  }

  disk {
    datastore_id = var.vm_disk_datastore_id
    interface    = var.vm_disk_interface
    size         = var.vm_disk_size
  }

  initialization {
    datastore_id      = var.vm_disk_datastore_id
    user_data_file_id = proxmox_virtual_environment_file.this.id

    user_account {
      username = var.vm_user_name
      password = var.vm_user_password
    }

    ip_config {
      ipv4 {
        address = var.vm_ipv4_address
        gateway = "10.44.88.190"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
