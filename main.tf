terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  # ensure process keeps running
  command = ["nginx", "-g", "daemon off;"]
}
