output "service_urls" {
  value       = { for app, config in var.testapps : app => "http://localhost:${config.nodePort}" }
  description = "URLs to access the deployed applications"
}
