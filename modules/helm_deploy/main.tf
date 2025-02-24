resource "kubernetes_namespace" "testapp" {
  metadata {
    name = var.app_name
  }

  lifecycle {
    replace_triggered_by = [null_resource.force_helm_refresh] # Triggers redeployment when cluster is recreated
  }
}

resource "helm_release" "testapp" {
  name          = var.app_name
  chart         = var.chart_file
  namespace     = kubernetes_namespace.testapp.metadata[0].name
  force_update  = true
  recreate_pods = true

  values = [
    templatefile(var.values_file, {
      replicaCount    = var.replica_count
      imageRepository = var.image_repository
      nodePort        = var.node_port
      servicePort     = var.service_port
    })
  ]

  lifecycle {
    replace_triggered_by = [null_resource.force_helm_refresh] # Triggers redeployment when cluster is recreated
  }
}

resource "null_resource" "force_helm_refresh" {
  triggers = {
    cluster_id = var.client_certificate
  }
}
