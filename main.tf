terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}



import {
  to       = aws_instance.tagged_instances_0
  provider = aws
  identity = {
    account_id = "405454589939"
    id         = "i-014254373450aa9c9"
    region     = "us-east-1"
  }
}

resource "aws_instance" "tagged_instances_0" {
  ami                                  = "ami-08982f1c5bf93d976"
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = 0
  key_name                             = "pki_demo"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.25.198"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-3"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0d8a06cf636a3280b"
  tags = {
    Environment = "prod"
    Name        = "app1-dev"
  }
  tags_all = {
    Environment = "prod"
    Name        = "app1-dev"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-06b2dea60cbb0c038"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  primary_network_interface {
    network_interface_id = "eni-0371ee92ba2d7f0c6"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}