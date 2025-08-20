output "eks_role_arn" {
   value = "${aws_iam_role.fruitbox_eks_role.arn}"
}

output "eks_role_name" {
   value = "${aws_iam_role.fruitbox_eks_role}"
}

output "eks_role_id" {
   value = "${aws_iam_role.fruitbox_eks_role.id}"
}

output "eks_policy_id" {
   value = "${aws_iam_role_policy_attachment.fruitbox_eks_role_policy.id}"
}

output "nodegrp_role_arn" {
   value = "${aws_iam_role.fruitbox_nodegrp_role.arn}"
}

output "nodegrp_role_name" {
   value = "${aws_iam_role.fruitbox_nodegrp_role}"
}

output "nodegrp_role_id" {
   value = "${aws_iam_role.fruitbox_nodegrp_role.id}"
}
