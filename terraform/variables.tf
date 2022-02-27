variable "project_domain" {
  default = "nsforge.store"
}

variable "do_region" {
  default = "ams3"
}

variable "do_image" {
  default = "docker-20-04"
}

variable "do_web_size" {
  default = "s-1vcpu-1gb"
}

variable "do_db_size" {
  default = "db-s-1vcpu-1gb"
}

variable "redmine_port" {
  default = "3000"
}
