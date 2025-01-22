terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}

resource "libvirt_volume" "vm_disk" {
  name   = "${var.vm_name}-disk"
  source = var.disk_image
  format = "qcow2"
  pool   = var.storage_pool
}

resource "libvirt_domain" "vm" {
  name   = var.vm_name
  memory = var.memory
  vcpu   = var.vcpu

  disk {
    volume_id = libvirt_volume.vm_disk.id
  }

  network_interface {
    network_name = var.network
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "none"
  }
}
