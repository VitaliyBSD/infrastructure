module "libvirt_vm" {
  source  = "../vm"
  vm_name = "example"
  memory  = 2048
  vcpu    = 1
  vmcount = 2
}

output "instance_ips" {
  value = module.libvirt_vm
}
