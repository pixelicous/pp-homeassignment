output "kubeconfig_path" {
  value = kind_cluster.this.kubeconfig_path
}

output "cluster_name" {
  value = kind_cluster.this.name
}

output "client_certificate" {
  value = kind_cluster.this.client_certificate
}
