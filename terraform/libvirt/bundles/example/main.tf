module "libvirt_vm" {
  source       = "../../module"
  libvirt_uri  = "qemu+ssh://vitaliy@192.168.0.3/system"
  vm_name      = "example-vm"
  memory       = 2048
  vcpu         = 2
  disk_image   = "/var/lib/libvirt/images/debian-12-generic-amd64.qcow2"
  network      = "default"
}

output "vm_id" {
  value = module.libvirt_vm.vm_id
}

output "vm_ip" {
  value = module.libvirt_vm.vm_ip
}
