resource "kind_cluster" "this" {
  name            = var.cluster_name
  node_image      = "kindest/node:${var.cluster_version}"
  kubeconfig_path = pathexpand(var.kubeconfig_file)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      dynamic "extra_port_mappings" {
        for_each = var.host_ports
        content {
          container_port = extra_port_mappings.value
          host_port      = extra_port_mappings.value
        }
      }
    }

    dynamic "node" {
      for_each = range(var.workers)
      content {
        role = "worker"
      }
    }
  }
}
