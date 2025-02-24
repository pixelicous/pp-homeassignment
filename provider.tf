terraform {
  required_version = ">= 1.5.7"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.35.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.17.0"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "= 0.8.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_file
  }
}

provider "kubernetes" {
  config_path = module.kind_cluster.kubeconfig_path
}
