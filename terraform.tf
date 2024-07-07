
terraform {
  required_version = ">= 1.4.6"


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
