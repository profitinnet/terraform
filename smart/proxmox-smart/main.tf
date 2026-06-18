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


module "prox-vm" {
  source = "../../modules/prox-vm"

  cloud_init_path      = "${path.module}/cloud-init/user-data.yaml"
  vm_node              = "smart"
  vm_id                = 202
  vm_name              = "N8N"
  vm_memory            = 8192
  vm_cpu_cores         = 6
  vm_disk_datastore_id = "storage"
  vm_disk_interface    = "scsi0"
  vm_disk_size         = 40
  vm_ipv4_address      = "10.44.88.207/24"
}
