replicaCount: ${replicaCount}

image:
  repository: ${imageRepository}
  tag: "latest"
  pullPolicy: IfNotPresent

service:
  port: ${servicePort}
  nodePort: ${nodePort}