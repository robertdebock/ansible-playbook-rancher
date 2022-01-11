resource "digitalocean_ssh_key" "rancher_demo" {
  name       = "rancher demo"
  public_key = file("${path.module}/files/id_rsa.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "rancher-demo" {
  # image     = "fedora-35-x64"
  image     = "centos-8-x64"
  name      = "rancher.meinit.nl"
  region    = "ams3"
  size      = "4gb"
  ssh_keys  = [digitalocean_ssh_key.rancher_demo.fingerprint]
}

data "cloudflare_zones" "meinit_nl" {
  filter {
    name = "meinit.nl"
  }
}

resource "cloudflare_record" "rancher_demo" {
  zone_id = data.cloudflare_zones.meinit_nl.zones[0].id
  name    = "rancher"
  value   = digitalocean_droplet.rancher-demo.ipv4_address
  type    = "A"
  ttl     = 300
}
