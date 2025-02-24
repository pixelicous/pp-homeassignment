variable "cluster_name" {
  type        = string
  description = "The kubernetes cluster name."
}

variable "cluster_version" {
  type        = string
  description = "The kubernetes version."
  default     = "v1.27.1"
}

variable "workers" {
  type        = number
  description = "The number of worker nodes to add."
  default     = 1
}

variable "kubeconfig_file" {
  type        = string
  description = "The file location for kubeconfig content."
  default     = "/tmp/kube.config"
}

variable "host_ports" {
  description = "The host ports to be bounded to the node ports."
  type        = list(number)
}
