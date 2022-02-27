resource "digitalocean_droplet" "webservers" {
  count  = 2
  image  = var.do_image
  name   = "web-server-${count.index}"
  region = var.do_region
  size   = var.do_web_size
  ssh_keys = [
    data.digitalocean_ssh_key.main.id
  ]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' -e 'db_host=${digitalocean_database_cluster.pg_cluster.host}' -e 'db_port=${digitalocean_database_cluster.pg_cluster.port}' -e 'db_username=${digitalocean_database_cluster.pg_cluster.user}' -e 'db_name=${digitalocean_database_cluster.pg_cluster.database}' -e 'db_password=${digitalocean_database_cluster.pg_cluster.password}' -e 'datadog_api_key=${var.datadog_api_key}' -e 'redmine_port=${var.redmine_port}' --private-key ${var.pvt_key} ../ansible/playbook.yml"
  }
}

output "droplet_ips" {
  value = {
    for droplet in digitalocean_droplet.webservers :
    droplet.name => droplet.ipv4_address
  }
}
