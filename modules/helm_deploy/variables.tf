variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "chart_file" {
  description = "Path to the Helm chart"
  type        = string
}

variable "values_file" {
  description = "Path to the Helm chart"
  type        = string
}

variable "replica_count" {
  description = "Number of replicas for the deployment"
  type        = number
}

variable "image_repository" {
  description = "The image repository to use when pulling images"
  type        = string
}

variable "service_port" {
  description = "Port exposed by the service"
  type        = number
}

variable "node_port" {
  description = "NodePort for external access"
  type        = number
}

variable "client_certificate" {
  description = "NodePort for external access"
  type        = string
}
