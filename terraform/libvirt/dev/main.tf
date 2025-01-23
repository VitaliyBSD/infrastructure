module "libvirt_vm" {
  source  = "../vm"
  vm_name = "example"
  memory  = 1024
  vcpu    = 1
  vmcount = 2
}
