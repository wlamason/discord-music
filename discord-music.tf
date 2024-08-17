terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}

resource "digitalocean_droplet" "discord-music" {
  # curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/images?page=1&per_page=200%type=distribution"
  image = "debian-12-x64"
  name = "discord-music"
  region = "nyc3"
  # curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/sizes" 
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  # copy Dockerfile
  provisioner "file" {
    source      = "Dockerfile"
    destination = "Dockerfile"
  }

  # copy config.txt
  provisioner "file" {
    source      = "config.txt"
    destination = "config.txt"
  }

  # provision droplet
  provisioner "remote-exec" {
    inline = [
      # apt setup
      "apt update",
      "apt upgrade",
      # install docker
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sh get-docker.sh",
      # build discord-music
      "docker build --tag discord-music .",
      # run discord-music
      "docker run --detach --name discord-music --restart=always discord-music",
    ]
  }
}
