module "kind_cluster" {
  source          = "./modules/kind-cluster"
  cluster_name    = "local-test-cluster"
  kubeconfig_file = var.kubeconfig_file
  cluster_version = "v1.27.0"

  host_ports = [
    for app in var.testapps : app.nodePort
  ]
}

module "test_app" {
  for_each = var.testapps
  source   = "./modules/helm_deploy"

  app_name           = each.key
  values_file        = "./helm/${each.key}/values.yaml.tpl"
  chart_file         = "./helm/${each.key}"
  replica_count      = each.value.replica_count
  image_repository   = each.value.image
  service_port       = each.value.servicePort
  node_port          = each.value.nodePort
  client_certificate = module.kind_cluster.client_certificate # Aids in dynamically refreshing apps

  depends_on = [module.kind_cluster]
}
