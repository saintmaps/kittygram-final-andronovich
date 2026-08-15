output "external_ip" {
  value = yandex_vpc_address.kittygram_ip.external_ipv4_address[0].address
}
