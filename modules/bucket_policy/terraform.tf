
terraform {
  required_providers {
    wasabi = {
       source  = "thesisedu/wasabi"
       version = "4.1.9"
    }
  }
}

provider "wasabi" {
  region = "us-east-1"
}
