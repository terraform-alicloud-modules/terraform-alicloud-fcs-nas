This module is used to create Function Compute Service to access NAS resources under Alibaba Cloud

terraform-alicloud-fcs-nas
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云创建 FC 并挂载 NAS。

本 Module 支持创建以下资源:

* [alicloud_fc_service](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/fc_service)
* [alicloud_ram_role_policy_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role_policy_attachment)
* [alicloud_ram_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role)
* [alicloud_ram_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_policy)
* [alicloud_vswitch](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch)
* [alicloud_vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc)
* [alicloud_security_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/security_group)
* [alicloud_nas_file_system](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/nas_file_system)
* [alicloud_ram_role_policy_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_role_policy_attachment)

## 用法

```hcl
module "fcs-nas" {
  source          = "terraform-alicloud-modules/fcs-nas/alicloud"
  instance_name   = "tf-fcs-nas"
  server_addr     = "terraform-nas.aliyuncs.com:/workspace/document"
  mount_dir       = "/home/www"
  group_id        = -1
  user_id         = -1
}
```

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.128.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.128.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
