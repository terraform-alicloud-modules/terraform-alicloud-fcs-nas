resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = var.role_name
  policy_name = var.policy_name
  policy_type = var.policy_type
}

resource "alicloud_fc_service" "default" {
  name            = var.name
  description     = var.description
  internet_access = var.internet_access
  role            = var.role
  depends_on      = [alicloud_ram_role_policy_attachment.default]
  vpc_config {
    security_group_id = var.security_group_id
    vswitch_ids       = var.vswitch_ids
  }
  nas_config {
    group_id = var.group_id
    user_id  = var.user_id
    mount_points {
      mount_dir   = var.mount_dir
      server_addr = var.server_addr
    }
  }
}
