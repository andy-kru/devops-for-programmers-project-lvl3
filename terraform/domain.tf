resource "digitalocean_domain" "nsforge" {
  name = var.project_domain
}

resource "digitalocean_record" "nsforge" {
  domain = digitalocean_domain.nsforge.name
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.do_loadbalancer.ip
}
