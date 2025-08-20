// EKS Cluster
resource "aws_eks_cluster" "fruitbox_eks_cluster" {

   name = "${var.eks_cluster_name}-${var.env}"
   version = var.eks_version
   role_arn = var.fruitbox_eks_role_arn

   vpc_config {
      endpoint_private_access = false 
      endpoint_public_access = true

      subnet_ids = [
         var.eks_subnet1,
         var.eks_subnet2,
         var.eks_subnet3
      ]
   }

   access_config {
      authentication_mode = "API"
      bootstrap_cluster_creator_admin_permissions = true
   }

   depends_on = [
      var.eks_role
   ]
}

// EKS Node group
resource "aws_eks_node_group" "fruitbox_eks_nodegrp" {

   cluster_name    = aws_eks_cluster.fruitbox_eks_cluster.name
   version = aws_eks_cluster.fruitbox_eks_cluster.version
   node_group_name = "${var.node_grp_name}-${var.env}"
   node_role_arn   = var.nodegrp_arn_name

   subnet_ids = [
      var.eks_subnet1,
      var.eks_subnet2,
   ]

   capacity_type = "ON_DEMAND"
   instance_types = [var.env == "prod" ? var.nodegrp_instance_type : "t3.medium"]

   scaling_config {
      desired_size = 3
      max_size     = 4
      min_size     = 2
   }

   update_config {
      max_unavailable = 1
   }

   labels = {
      role = "general"
   }

   depends_on = [
      var.eks_nodegrp_role_name
   ]

   lifecycle {
     ignore_changes = [ scaling_config[0].desired_size ]
   }
}