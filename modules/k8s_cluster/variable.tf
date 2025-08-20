variable "env" {
   description = "Env for where resource will be deployed"
}

variable "eks_cluster_name" {
   description = "Fruitbox eks cluster name"
}

variable "eks_version" {
   description = "Fruitbox eks version"
}

variable "fruitbox_eks_role_arn" {
   description = "Fruitbox eks cluster arn"
}

variable "eks_subnet1" {
   description = "Fruitbox eks subnet1"
}

variable "eks_subnet2" {
   description = "Fruitbox eks subnet2"
}

variable "eks_subnet3" {
   description = "Fruitbox eks subnet3"
}

variable "node_grp_name" {
   description = "Fruitbox eks node group name"
}

variable "nodegrp_arn_name" {
   description = "Fruitbox eks node group arn"
}

variable "nodegrp_instance_type" {
   description = "Fruitbox eks node group instance type"
}

variable "eks_role" {

}

variable "eks_nodegrp_role_name" {
   
}