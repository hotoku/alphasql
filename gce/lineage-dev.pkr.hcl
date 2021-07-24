packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "image-suffix" {
  type    = string
  default = "no-suffix"
}

source "googlecompute" "lineage-dev" {
  project_id          = "yasunori-horikoshi-sandbox"
  source_image        = "ubuntu-1804-bionic-v20210720"
  ssh_username        = "packer"
  zone                = "asia-northeast1-b"
  startup_script_file = "startup.sh"
  image_name          = "lineage-dev-${var.image-suffix}"
  machine_type        = "c2-standard-16"
}

build {
  sources = [
    "sources.googlecompute.lineage-dev"
  ]
}
