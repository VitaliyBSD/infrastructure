module "libvirt_vm" {
  source      = "../vm"
  vm_name     = "example"
  memory      = 2048
  vcpu        = 2
}
