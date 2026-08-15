variable "yc_region" {
  description = "Yandex Cloud region name"
  type        = string
  default     = "ru-central1"
}

variable "yc_zone" {
  description = "Yandex Cloud zone name"
  type        = string
  default     = "ru-central1-a"
}

variable "cloud_id" {
  description = "Yandex Cloud cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "net_cidr" {
  description = "Subnets and their CIDR blocks"
  type = list(object({
    name   = string
    zone   = string
    prefix = string
  }))
}

variable "vm_name" {
  type    = string
  default = "vm-kittygram"
}

variable "vm_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "os_image_family" {
  type    = string
  default = "ubuntu-2404-lts"
}

variable "platform_id" {
  description = "Defines CPU type"
  type        = string
  default     = "standard-v1"
}

variable "cores" {
  type    = number
  default = 2
}

variable "core_fraction" {
  description = "Using a fraction of CPU is cheaper"
  type        = number
  default     = 20
}

variable "memory" {
  type    = number
  default = 4
}

variable "disk_type" {
  type    = string
  default = "network-ssd"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "nat" {
  type    = string
  default = "true"
}

variable "vm_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_key" {
  description = "SSH Public Key"
  type        = string
}
