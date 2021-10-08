variable "name" {
  default = "terraformtest"
}

provider "alicloud" {
  region  = "cn-shenzhen"
  profile = "default"
}

resource "alicloud_log_project" "default" {
  name = var.name
}

resource "alicloud_log_store" "default" {
  project = alicloud_log_project.default.name
  name    = var.name
}

resource "alicloud_ram_role" "default" {
  name        = var.name
  document    = <<EOF
  {
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Effect": "Allow",
          "Principal": {
            "Service": [
              "fc.aliyuncs.com"
            ]
          }
        }
      ],
      "Version": "1"
  }
  EOF
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_policy" "default" {
  policy_name     = var.name
  policy_document = <<EOF
  {
    "Statement": [
      {
        "Action": [
          "vpc:DescribeVSwitchAttributes",
          "ecs:DeleteNetworkInterface",
          "ecs:DescribeNetworkInterfacePermissions",
          "ecs:DescribeNetworkInterfaces",
          "ecs:CreateNetworkInterfacePermission",
          "ecs:CreateNetworkInterface"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ],
      "Version": "1"
  }
  EOF
  description     = "this is a policy test"
  force           = true
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

data "alicloud_fc_zones" "default" {}

resource "alicloud_vswitch" "default" {
  vpc_id     = alicloud_vpc.default.id
  cidr_block = "172.16.0.0/21"
  zone_id    = "${data.alicloud_fc_zones.default.zones.0.id}"
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "ask-nas"
  encrypt_type  = "1"
}

module "example" {
  source            = "../"
  name              = var.name
  role              = alicloud_ram_role.default.arn
  security_group_id = alicloud_security_group.default.id
  vswitch_ids       = [alicloud_vswitch.default.id]
  server_addr       = "${var.name}-nas.aliyuncs.com:/workspace/document"
  role_name         = alicloud_ram_role.default.name
  policy_name       = alicloud_ram_policy.default.name
  policy_type       = alicloud_ram_policy.default.type
}
