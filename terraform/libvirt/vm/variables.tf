variable "libvirt_uri" {
  type        = string
  description = "URI for the libvirt connection."
  default     = "qemu:///system"
}

variable "vm_name" {
  type        = string
  description = "The name of the VM."
}

variable "memory" {
  type        = number
  description = "Memory in MB for the VM."
  default     = 1024
}

variable "vcpu" {
  type        = number
  description = "Number of virtual CPUs for the VM."
  default     = 1
}

variable "disk_image" {
  type        = string
  description = "Path to the QCOW2 image."
  default     = "http://pluto/packer-debian-latest.qcow2"
}

variable "storage_pool" {
  type        = string
  description = "Libvirt storage pool for the VM disk."
  default     = "default"
}

variable "network" {
  type        = string
  description = "Libvirt network name for the VM."
  default     = "default"
}

variable "vmcount" {
  type        = number
  description = "Number of VM instances to create."
  default     = 1
}
