output "vm_id" {
  value = libvirt_domain.vm.id
}

output "vm_ip" {
  value = libvirt_domain.vm.network_interface.0.addresses
}
