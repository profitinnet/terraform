output "postgres_ipv4_addresses" {
  value = module.prox_vm_postgres.ipv4_addresses
}

output "postgres_name" {
  value = module.prox_vm_postgres.vm_name
}

output "postgres_vmid" {
  value = module.prox_vm_postgres.vm_id
}
