terraform {
  backend "remote" {
    organization = "AWACS-CLOUD"

    workspaces {
      name = "awacs-cloud-production-shakeout"
    }
  }
}
