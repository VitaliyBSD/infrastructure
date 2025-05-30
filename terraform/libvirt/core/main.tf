terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "lab" {
  name = "lab"
  type = "dir"
  target {
    path = "/srv/vm"
  }
}

resource "libvirt_network" "lab" {
  name      = "lab"
  mode      = "nat"
  domain    = "lab.local"
  addresses = ["10.0.0.1/8"]
}
