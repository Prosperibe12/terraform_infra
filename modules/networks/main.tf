// Network configuration for infrastructure resources

// virtual private loud (VPC) configuration
resource "aws_vpc" "fruitbox_vpc" {
   cidr_block = var.vpc_cidr

   tags = {
      Name = var.vpc_name
   }
}

// private subnet configuration
resource "aws_subnet" "fruitbox_private_subnet" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   cidr_block = var.private_subnet_cidr 
   map_public_ip_on_launch = var.private_subnet_map_public_ip_on_launch
   availability_zone = var.private_subnet_availability_zones 
   depends_on = [ aws_vpc.fruitbox_vpc ]

   tags = {
      Name = var.private_subnet_name
   }
}

// private subnet route table configuration
resource "aws_route_table" "fruitbox_private_subnet_route_table" {
   vpc_id = aws_vpc.fruitbox_vpc.id
   depends_on = [ aws_subnet.fruitbox_private_subnet ]

   tags = {
      Name = var.private_route_table
   }
}

// private route table association
resource "aws_route_table_association" "fruitbox_private_rt_association" {
  subnet_id      = aws_subnet.fruitbox_private_subnet.id
  route_table_id = aws_route_table.fruitbox_private_subnet_route_table.id
  depends_on = [ aws_route_table.fruitbox_private_subnet_route_table ]
}

// natgateway configuration
resource "aws_nat_gateway" "fruitbox_nat_gateway" {
   allocation_id = aws_eip.fruitbox_elastic_ip.id
   subnet_id     = aws_subnet.fruitbox_public_subnet.id

   tags = {
      Name = var.fruitbox_nat_gateway_name
   }

   depends_on = [ 
      aws_internet_gateway.fruitbox_internet_gateway, 
      aws_subnet.fruitbox_public_subnet, 
      aws_route_table.fruitbox_private_subnet_route_table, 
      aws_route_table_association.fruitbox_private_rt_association
   ]
}

// elastic IP for NAT gateway
resource "aws_eip" "fruitbox_elastic_ip" {
   domain   = "vpc"
}

// associate NAT gateway with private route table
resource "aws_route" "fruitbox_nat_gateway_route" {
   route_table_id         = aws_route_table.fruitbox_private_subnet_route_table.id
   destination_cidr_block = var.nat_gateway_destination_cidr_block
   nat_gateway_id         = aws_nat_gateway.fruitbox_nat_gateway.id
   depends_on = [ aws_nat_gateway.fruitbox_nat_gateway, aws_route_table.fruitbox_private_subnet_route_table ]
}

// public subnet configuration
resource "aws_subnet" "fruitbox_public_subnet" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   cidr_block = var.public_subnet_cidr 
   map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch
   availability_zone = var.public_subnet_availability_zones 
   depends_on = [ aws_vpc.fruitbox_vpc ]

   tags = {
      Name = var.public_subnet_name
   }
}

// public subnet route table configuration
resource "aws_route_table" "fruitbox_public_subnet_route_table" {
   vpc_id = aws_vpc.fruitbox_vpc.id
   depends_on = [ aws_subnet.fruitbox_public_subnet ]

   tags = {
      Name = var.public_route_table
   }
}

// public route table association
resource "aws_route_table_association" "fruitbox_public_rt_association" {
  subnet_id      = aws_subnet.fruitbox_public_subnet.id
  route_table_id = aws_route_table.fruitbox_public_subnet_route_table.id
  depends_on = [ aws_route_table.fruitbox_public_subnet_route_table ]

}

// internet gateway configuration
resource "aws_internet_gateway" "fruitbox_internet_gateway" {
   vpc_id = aws_vpc.fruitbox_vpc.id
   tags = {
      Name = var.internet_gateway_name
   }
}

// associate internet gateway with public route table
resource "aws_route" "fruitbox_internet_gateway_route" {
   route_table_id         = aws_route_table.fruitbox_public_subnet_route_table.id
   destination_cidr_block = var.internet_gt_destination_cidr_block
   gateway_id             = aws_internet_gateway.fruitbox_internet_gateway.id
   depends_on = [ aws_internet_gateway.fruitbox_internet_gateway, aws_route_table.fruitbox_public_subnet_route_table ]
}

