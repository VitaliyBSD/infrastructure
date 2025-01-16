module "libvirt_vm" {
  source      = "../../module"
  libvirt_uri = "qemu+ssh://vitaliy@192.168.0.3/system"
  vm_name     = "example"
  memory      = 2048
  vcpu        = 2
  disk_image  = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
}
