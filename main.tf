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
  provider                             = aws
  ami                                  = "ami-08982f1c5bf93d976"
  arn                                  = "arn:aws:ec2:us-east-1:405454589939:instance/i-014254373450aa9c9"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = ""
  iam_instance_profile                 = ""
  id                                   = "i-014254373450aa9c9"
  instance_initiated_shutdown_behavior = "stop"
  instance_lifecycle                   = ""
  instance_state                       = "running"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "pki_demo"
  monitoring                           = false
  outpost_arn                          = ""
  password_data                        = ""
  placement_group                      = ""
  placement_group_id                   = ""
  placement_partition_number           = 0
  primary_network_interface_id         = "eni-0371ee92ba2d7f0c6"
  private_dns                          = "ip-172-31-25-198.ec2.internal"
  private_ip                           = "172.31.25.198"
  public_dns                           = "ec2-18-234-87-199.compute-1.amazonaws.com"
  public_ip                            = "18.234.87.199"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-3"]
  source_dest_check                    = true
  spot_instance_request_id             = ""
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
    amd_sev_snp      = ""
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
    delete_on_termination = true
    network_interface_id  = "eni-0371ee92ba2d7f0c6"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    kms_key_id            = ""
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_id             = "vol-09d1b4b6985f3489b"
    volume_size           = 8
    volume_type           = "gp3"
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}
