terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "kittygram-s4-bucket"
    region = "ru-central1"
    key    = "tf-state.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    # Terraform State Lock, чтобы избежать одновременного изменения состояния несколькими пользователями
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gn0dch107j3ko8njsj/etnlclbq80chp5vm0ed9"
    dynamodb_table    = "state-lock"
  }
}

provider "yandex" {
  service_account_key_file = "authorized_key.json"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.yc_zone
}
