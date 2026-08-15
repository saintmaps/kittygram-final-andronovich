data "yandex_compute_image" "ubuntu_lts" {
  family = var.os_image_family
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  hostname    = var.vm_name
  zone        = var.vm_zone
  platform_id = var.platform_id

  resources {
    cores         = var.cores
    core_fraction = var.core_fraction
    memory        = var.memory
  }

  boot_disk {
    initialize_params {
      type     = var.disk_type
      image_id = data.yandex_compute_image.ubuntu_lts.id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram_subnet[0].id
    nat                = var.nat
    nat_ip_address     = yandex_vpc_address.kittygram_ip.external_ipv4_address[0].address
    security_group_ids = [yandex_vpc_security_group.kittygram_sg.id]
  }

  metadata = {
    serial-port-enable = 1
    enable-os-login    = true
    user-data = templatefile("${path.module}/init/vm-install.yml",
      {
        USER    = var.vm_user
        SSH_KEY = var.ssh_key
    })
    ssh-keys = "${var.vm_user}:${var.ssh_key}" # Специальный формат для Cloud-init в YC
  }
}
