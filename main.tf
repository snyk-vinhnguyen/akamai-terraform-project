terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "snyk"

    workspaces {
      name = "akamai-config"
    }
  }
  required_version = ">= v0.14.6"
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 1.3.1"

    }
    tfe = {
      version = "~> 0.24.0"
    }
  }
}

/*
provider "akamai" {
  config_section = "default"
}
*/

module "dns_guypocom" {
  source               = "./workspace"
  name                 = "akamai-dns-guypo"
  working_directory    = "dns/guypocom"
  akamai_host          = var.AKAMAI_HOST
  akamai_access_token  = var.AKAMAI_ACCESS_TOKEN
  akamai_client_token  = var.AKAMAI_CLIENT_TOKEN
  akamai_client_secret = var.AKAMAI_CLIENT_SECRET
}

/*
module "dns_sntk_io" {
  source = "./dns/snykio"
  groupid = var.groupid
}
*/
