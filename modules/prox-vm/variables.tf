variable "cloud_init_path" {
  type        = string
  description = "Path to cloud init config"
}

variable "vm_node" {
  type        = string
  description = "Proxmox node where the VM will be created"
}

variable "vm_id" {
  type        = number
  description = "ID of the VM"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_memory" {
  type        = number
  description = "Memory allocated to the VM in MB"
  default     = 4096
}

variable "vm_cpu_cores" {
  type        = number
  description = "Number of CPU cores allocated to the VM"
  default     = 2
}

variable "vm_disk_datastore_id" {
  type        = string
  description = "ID of the datastore where the VM disk will be created"
  default     = "storage"
}

variable "vm_disk_interface" {
  type        = string
  description = "Disk interface type (e.g., scsi0, sata0)"
  default     = "scsi0"
}

variable "vm_disk_size" {
  type        = number
  description = "Size of the VM disk in GB"
  default     = 40
}

variable "vm_ipv4_address" {
  type        = string
  description = "IPv4 address for the VM"
}

variable "vm_user_name" {
  type        = string
  description = "Username for the VM"
  default     = "legrey"
}

variable "vm_user_password" {
  type        = string
  description = "Password for the VM user"
  default     = "12345678"
}
