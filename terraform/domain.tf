resource "digitalocean_domain" "nsforge" {
  name       = var.project_domain
  ip_address = digitalocean_loadbalancer.do_loadbalancer.ip
}
