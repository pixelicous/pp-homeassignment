variable "kubeconfig_file" {
  type        = string
  description = "The file location for kubeconfig content."
  default     = "/tmp/kube.config"
}

variable "testapps" {
  type = map(object({
    replica_count = number
    image         = string
    servicePort   = number
    nodePort      = number
  }))

  description = "Test applications configuration"
}
