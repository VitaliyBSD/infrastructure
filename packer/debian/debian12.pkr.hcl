// debian12.pkr.hcl
variable "image_name" {
  default = "debian-12"
}

source "qemu" "debian12" {
  iso_urls         = ["http://pluto/debian-12.11.0-amd64-netinst.iso"]
  iso_checksum     = "sha512:0921d8b297c63ac458d8a06f87cd4c353f751eb5fe30fd0d839ca09c0833d1d9934b02ee14bbd0c0ec4f8917dde793957801ae1af3c8122cdf28dde8f3c3e0da"
  output_directory = "output-debian12"
  disk_size        = "5000"
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
    "grub-installer/only_debian=true <wait>",
    "grub-installer/with_other_os=false <wait>",
    "grub-installer/bootdev=/dev/vda <wait>",
    "<enter>"
  ]

  http_directory   = "http"
  shutdown_command = "sudo shutdown -h now"
  communicator     = "ssh"
  ssh_username     = "vitaliy"
  ssh_password     = "vitaliy"
  ssh_timeout      = "30m"
  headless         = true
}

build {
  sources = ["source.qemu.debian12"]
}
