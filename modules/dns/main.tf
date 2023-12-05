terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "snyk"

    workspaces {
      name = "akamai-dns-guypo"
    }
  }
  required_version = ">= v0.14.6"
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 1.3.1"

    }
  }
}

provider "akamai" {
  dns_section = var.dnssection
}
