resource "yandex_vpc_network" "kittygram_network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "kittygram_subnet" {
  count          = length(var.net_cidr)
  name           = var.net_cidr[count.index].name
  zone           = var.net_cidr[count.index].zone
  v4_cidr_blocks = [var.net_cidr[count.index].prefix]
  network_id     = yandex_vpc_network.kittygram_network.id
}

resource "yandex_vpc_security_group" "kittygram_sg" {
  name       = "${var.vpc_name}-sg"
  network_id = yandex_vpc_network.kittygram_network.id

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = "22"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = "80"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_address" "kittygram_ip" {
  name = "kittygram-ip"
  external_ipv4_address {
    zone_id = var.vm_zone
  }
}
