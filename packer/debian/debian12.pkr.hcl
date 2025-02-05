// debian12.pkr.hcl
variable "image_name" {
  default = "debian-12"
}

source "qemu" "debian12" {
  iso_urls         = ["http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.9.0-amd64-netinst.iso"]
  iso_checksum     = "file:http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS"
  output_directory = "output-debian12"
  disk_size        = "20000" # 20GB
  format           = "qcow2"
  accelerator      = "kvm"
  cpus             = 2
  memory           = 2048

  boot_command = [
    "<esc><wait>",
    "auto <wait>",
    "install <wait>",
    " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
    "debian-installer=en_US <wait>",
    "kbd-chooser/method=us <wait>",
    "netcfg/get_hostname={{ .Name }} <wait>",
    "netcfg/get_domain=local <wait>",
    "fb=false <wait>",
    "debian-installer/locale=en_US <wait>",
    "console-setup/ask_detect=false <wait>",
    "keyboard-configuration/xkb-keymap=us <wait>",
    "<enter>"
  ]

  http_directory   = "http"
  shutdown_command = "sudo shutdown -h now"
  communicator     = "ssh"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_timeout      = "30m"
}

build {
  sources = ["source.qemu.debian12"]
}
