resource "digitalocean_ssh_key" "rancher-demo" {
  name       = "rancher demo"
  public_key = file("${path.module}/files/id_rsa.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "rancher-example" {
  image     = "rancheros"
  name      = "rancher.meinit.nl"
  region    = "ams3"
  size      = "4gb"
  ssh_keys  = [digitalocean_ssh_key.rancher-demo.fingerprint]
}

data "cloudflare_zones" "default" {
  filter {
    name = "meinit.nl"
  }
}

resource "cloudflare_record" "rancher" {
  zone_id = data.cloudflare_zones.default.zones[0].id
  name    = "rancher"
  value   = digitalocean_droplet.rancher-example.ipv4_address
  type    = "A"
  ttl     = 300
}
