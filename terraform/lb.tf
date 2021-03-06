resource "digitalocean_certificate" "do_cert" {
  name    = "do-cert"
  type    = "lets_encrypt"
  domains = ["${digitalocean_domain.nsforge.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_loadbalancer" "do_loadbalancer" {
  name   = "do-do_loadbalancer"
  region = var.do_region

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = var.redmine_port
    target_protocol = "http"

    certificate_name = digitalocean_certificate.do_cert.name
  }

  healthcheck {
    port     = var.redmine_port
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.webservers.*.id
}
