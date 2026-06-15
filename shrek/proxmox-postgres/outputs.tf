output "postgres_ipv4_addresses" {
  value = proxmox_virtual_environment_vm.postgres.ipv4_addresses
}

output "postgres_name" {
  value = proxmox_virtual_environment_vm.postgres.name
}

output "postgres_vmid" {
  value = proxmox_virtual_environment_vm.postgres.vm_id
}
