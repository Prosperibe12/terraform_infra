// Role for EKS cluster
resource "aws_iam_role" "fruitbox_eks_role" {
   name = "${var.role_name}-${var.env}"
   assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
      {
         Action = "sts:AssumeRole"
         Effect = "Allow"
         Principal = {
            Service = "eks.amazonaws.com"
         }
      },
      ]
   })

   tags = {
     "key" = "${var.role_name_tag}-${var.env}"
   }
}

// EKS Cluster Role policy attachment
resource "aws_iam_role_policy_attachment" "fruitbox_eks_role_policy" {
   role       = aws_iam_role.fruitbox_eks_role.name
   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

// Node Group Role
resource "aws_iam_role" "fruitbox_nodegrp_role" {
   name = "${var.eks_nodegrp_role_name}-${var.env}"
   assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
      {
         Action = "sts:AssumeRole"
         Effect = "Allow"
         Principal = {
            Service = "ec2.amazonaws.com"
         }
      },
      ]
   })

   tags = {
     "key" = "${var.eks_nodegrp_role_name_tag}-${var.env}"
   }
}

// Node Group Role policy attachment
resource "aws_iam_role_policy_attachment" "fruitbox_eks_node_policy" {
   role       = aws_iam_role.fruitbox_nodegrp_role.name
   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "fruitbox_eks_node_policy_2" {
   role       = aws_iam_role.fruitbox_nodegrp_role.name
   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "fruitbox_eks_node_policy_3" {
   role       = aws_iam_role.fruitbox_nodegrp_role.name
   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}