terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "sandip"

    workspaces {
      name = "dev"
    }
  }
}
