terraform {
  backend "remote" {
    organization = "nsforge-org"

    workspaces {
      name = "nsforge-workspace"
    }
  }
}
