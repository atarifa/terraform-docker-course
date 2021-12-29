module "image" {
  source   = "./image"
  image_in = var.image[terraform.workspace]
}

module "container" {

  source            = "./container"
  count             = local.container_count
  name_in           = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image_in          = module.image.image_out
  int_port_in       = 1880
  ext_port_in       = var.ext_port[terraform.workspace][count.index]
  container_path_in = "/data"
  host_path_in      = "${path.cwd}/noderedvol"

}

resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
  upper   = "false"
}