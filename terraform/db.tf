resource "digitalocean_database_cluster" "pg_cluster" {
  name       = "pg-cluster"
  engine     = "pg"
  version    = "11"
  region     = var.do_region
  size       = var.do_db_size
  node_count = 1
}

resource "digitalocean_database_db" "pg-db" {
  name       = "pg-db"
  cluster_id = digitalocean_database_cluster.pg_cluster.id
}
