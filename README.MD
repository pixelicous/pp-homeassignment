# Overview

This repository contains Terraform configurations to deploy a local Kubernetes cluster using kind, set up a simple web application, and expose it using a Kubernetes Service with a NodePort.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) (>= 1.5.7)
- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)

## Usage

### Initializing Terraform

Run the following command to initialize the Terraform environment:

```sh
terraform init
```

### Planning and Applying the Configuration

Before applying the configuration, you can preview the changes Terraform will make by running:

```sh
terraform plan
```

This will show a detailed summary of resources that will be created, modified, or destroyed.

To deploy the local infrastructure, execute:

```sh
terraform apply -auto-approve
```

### Destroying the Infrastructure

To remove all resources created by this module, run:

```sh
terraform destroy -auto-approve
```

## Module Inputs

The module accepts several input variables, defined in `variables.tf`. Modify these as needed before deployment.

## Outputs

After successful deployment, the module will output the application endpoints. You can check outputs using:

```sh
terraform output
```

The expected output will be:

```hcl
service_urls = {
  "app1" = "http://localhost:<port1>"
  "app2" = "http://localhost:<port2>"
  .
  .
}
```

The actual ports will depend on the values provided by the user during deployment.

## Deploy Additional Applications

To add a new application, simply extend the `testapps` map in `terraform.auto.tfvars` by defining a new key-value pair, and ensure a matching directory exists under /helm for the application’s Helm chart. Verify that the Helm chart directory and port values are properly configured.

```hcl
testapps = {
  app1 = {
    ...
  }
  app2 = {
    ...
  }
  app3 = {
    chart_dir     = "./helm/<app_name_3>"
    replica_count = <number_of_replicas>
    image         = "<container_image>"
    servicePort   = <service_port>
    nodePort      = <node_port>
  }
}
```

## Checking the Cluster

To interact with the Kubernetes cluster, set the KUBECONFIG environment variable to the configured path:

```sh
export KUBECONFIG=/tmp/kube.config
```

(The actual path is defined under `var.kubeconfig_file`.)
