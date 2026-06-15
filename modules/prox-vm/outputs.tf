output "vm_ip" {
  value       = proxmox_virtual_environment_vm.this.network_device[0].ip_address
  description = "IPv4 address of the VM"
}
