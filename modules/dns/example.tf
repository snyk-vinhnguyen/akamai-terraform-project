locals {
    zone = "placeholder.com"
}

resource "akamai_dns_zone" "placeholder_com" {
    contract = var.contractid
    group = var.groupid
    zone = local.zone
    type = "PRIMARY"
    masters = []
    comment = ""
    sign_and_serve = false
    sign_and_serve_algorithm = ""
    target = ""
    end_customer_id = ""
}


resource "akamai_dns_record" "placeholder_com_CNAME" {
    zone = local.zone
    target = ["www.placeholder.com.edgekey.net."]
    name = "*.placeholder.com"
    recordtype = "CNAME"
    ttl = 7200
}

resource "akamai_dns_record" "placeholder_com_AKAMAICDN" {
    zone = local.zone
    recordtype = "AKAMAICDN"
    ttl = 20
    target = ["www.placeholder.com.edgekey.net"]
    name = "placeholder.com"
}

resource "akamai_dns_record" "placeholder_com_NS" {
    zone = local.zone
    ttl = 172800
    target = ["a1-49.akam.net.", "a16-64.akam.net.", "a9-64.akam.net.", "a7-67.akam.net.", "a26-66.akam.net.", "a22-65.akam.net."]
    name = "placeholder.com"
    recordtype = "NS"
}

resource "akamai_dns_record" "placeholder_com_SOA" {
    zone = local.zone
    refresh = 43200
    retry = 7200
    expiry = 604800
    recordtype = "SOA"
    name_server = "a1-49.akam.net."
    email_address = "hostmaster.akamai.com."
    nxdomain_ttl = 7200
    name = "placeholder.com"
    ttl = 86400
    target = []
}

resource "akamai_dns_record" "www_placeholder_com_CNAME" {
    zone = local.zone
    recordtype = "CNAME"
    ttl = 7200
    target = ["www.placeholder.com.edgekey.net."]
    name = "www.placeholder.com"
