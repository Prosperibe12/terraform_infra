variable "env" {
   description = "Enviroment where resource is created"
}

variable "role_name" {
   description = "Fruitbox EKS Cluster role name"
}

variable "role_name_tag" {
   default = "fruitbox-eks-role"
}

variable "eks_nodegrp_role_name" {
   default = "fruitbox-eks-nodegrp-role"
}

variable "eks_nodegrp_role_name_tag" {
   default = "fruitbox-eks-nodegrp-tag"
}
