output "ssh_user" {
  value = "${var.ssh_user}"
}

output "security_group_id" {
  value = "${element(concat(aws_security_group.bastion.*.id, list("")), 0)}"
}

output "asg_id" {
  value = "${element(concat(aws_autoscaling_group.bastion.*.id, list("")), 0)}"
}

# Part of a hack for module-to-module dependencies.
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
# and
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-473091030
output "depended_on" {
  value = "${null_resource.dependency_setter.id}-${timestamp()}"
}
