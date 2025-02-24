testapps = {
  app1 = {
    chart_dir     = "./helm/app1"
    replica_count = 4
    image         = "nginx"
    servicePort   = 80
    nodePort      = 30080
  }
  app2 = {
    chart_dir     = "./helm/app2"
    replica_count = 2
    image         = "hashicorp/http-echo"
    servicePort   = 5678
    nodePort      = 30081
  }
  # app3 = {
  #   chart_dir     = "./helm/app3"
  #   replica_count = 2
  #   image         = "hashicorp/http-echo"
  #   servicePort   = 5679
  #   nodePort      = 30082
  # }
}
