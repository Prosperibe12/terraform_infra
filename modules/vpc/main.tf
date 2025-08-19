// Project VPC
data "aws_availability_zones" "vpc_availability_zones" {
   state  = "available"
   filter {
      name   = "region-name"
      values = [var.vpc_region]
   }
}

resource "random_shuffle" "az_selection" {
  input        = data.aws_availability_zones.vpc_availability_zones.names
  result_count = 3
}

locals {
  random_az = random_shuffle.az_selection.result
}

resource "aws_vpc" "fruitbox_vpc" {
   cidr_block = var.vpc_cidr_block
   enable_dns_hostnames = var.enable_dns_hostnames
   region = var.vpc_region

   tags = {
      Name = "${var.vpc_name}-${var.env}"
   }
}

// Public Subnet
resource "aws_subnet" "fruitbox_public_subnet" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   map_public_ip_on_launch = var.map_public_ip_on_launch
   cidr_block = var.public_subnet_cidr_block
   availability_zone = local.random_az[1]

   tags = {
      Name = "${var.public_subnet_name}-${var.env}"
   }
}

// Private Subnet 1
resource "aws_subnet" "fruitbox_private_subnet1" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   cidr_block = var.private_subnet1_cidr_block
   availability_zone = local.random_az[0]

   tags = {
      Name = "${var.private_subnet1_name}-${var.env}"
   }
}

// Private Subnet 2 
resource "aws_subnet" "fruitbox_private_subnet2" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   cidr_block = var.private_subnet2_cidr_block
   availability_zone = local.random_az[1]

   tags = {
      Name = "${var.private_subnet2_name}-${var.env}"
   }
}

// Private Subnet 3
resource "aws_subnet" "fruitbox_private_subnet3" {
   vpc_id     = aws_vpc.fruitbox_vpc.id
   cidr_block = var.private_subnet3_cidr_block
   availability_zone = local.random_az[2]

   tags = {
      Name = "${var.private_subnet3_name}-${var.env}"
   }
}

// Elastic IP Address
resource "aws_eip" "fruitbox_eip" {
   domain   = "vpc"
}

// Internet Gateway
resource "aws_internet_gateway" "fruitbox_igw" {
   vpc_id = aws_vpc.fruitbox_vpc.id
   depends_on = [ aws_subnet.fruitbox_public_subnet ]

   tags = {
      Name = "${var.internet_gw_name}-${var.env}"
   }
}

// Nat Gateway
resource "aws_nat_gateway" "fruitbox_nat_gw" {
   allocation_id = aws_eip.fruitbox_eip.id
   subnet_id     = aws_subnet.fruitbox_public_subnet.id

   tags = {
      Name = "${var.nat_gw_name}-${var.env}"
   }

   depends_on = [
      aws_internet_gateway.fruitbox_igw, 
      aws_subnet.fruitbox_private_subnet1, 
      aws_subnet.fruitbox_private_subnet2, 
      aws_subnet.fruitbox_private_subnet3
   ]
}

// Public Route Table 
resource "aws_route_table" "fruitbox_public_rt" {
   vpc_id = aws_vpc.fruitbox_vpc.id

   tags = {
      Name = "${var.public_rt_name}-${var.env}"
   }
   depends_on = [ aws_subnet.fruitbox_public_subnet ]
}

// Private Route Table
resource "aws_route_table" "fruitbox_private_rt" {
   vpc_id = aws_vpc.fruitbox_vpc.id

   tags = {
      Name = "${var.private_rt_name}-${var.env}"
   }
}

// Public Route Table Subnet Association
resource "aws_route_table_association" "fruitbox_public_rt_association" {
   subnet_id      = aws_subnet.fruitbox_public_subnet.id
   route_table_id = aws_route_table.fruitbox_public_rt.id
   depends_on = [ aws_route_table.fruitbox_public_rt ]
}

// Private Route Table Subnet Association
resource "aws_route_table_association" "fruitbox_private_rt_association1" {
   subnet_id      = aws_subnet.fruitbox_private_subnet1.id
   route_table_id = aws_route_table.fruitbox_private_rt.id
   depends_on = [ aws_route_table.fruitbox_private_rt ]
}

resource "aws_route_table_association" "fruitbox_private_rt_association2" {
   subnet_id      = aws_subnet.fruitbox_private_subnet2.id
   route_table_id = aws_route_table.fruitbox_private_rt.id
   depends_on = [ aws_route_table.fruitbox_private_rt ]
}

resource "aws_route_table_association" "fruitbox_private_rt_association3" {
   subnet_id      = aws_subnet.fruitbox_private_subnet3.id
   route_table_id = aws_route_table.fruitbox_private_rt.id
   depends_on = [ aws_route_table.fruitbox_private_rt ]
}

// Public Route
resource "aws_route" "public_rt_route" {
   route_table_id            = aws_route_table.fruitbox_public_rt.id
   destination_cidr_block    = var.igw_destination_cidr_block
   gateway_id = aws_internet_gateway.fruitbox_igw.id
   depends_on = [ 
      aws_internet_gateway.fruitbox_igw,
      aws_route_table.fruitbox_public_rt,
      aws_route_table_association.fruitbox_public_rt_association
   ]
}

// Private Route
resource "aws_route" "private_rt_route" {
   route_table_id            = aws_route_table.fruitbox_private_rt.id
   destination_cidr_block    = var.ngw_destination_cidr_block
   nat_gateway_id = aws_nat_gateway.fruitbox_nat_gw.id
   depends_on = [ 
      aws_nat_gateway.fruitbox_nat_gw,
      aws_route_table.fruitbox_private_rt,
      aws_route_table_association.fruitbox_private_rt_association1,
      aws_route_table_association.fruitbox_private_rt_association2,
      aws_route_table_association.fruitbox_private_rt_association3
   ]
}

// Subnet group for database
resource "aws_db_subnet_group" "fruitbox_subnet_group" {
   name = "${var.subnet_grp_name}-${var.env}"
   subnet_ids = [
      aws_subnet.fruitbox_private_subnet1.id,
      aws_subnet.fruitbox_private_subnet2.id,
      aws_subnet.fruitbox_private_subnet3.id
   ]

   tags = {
      Name = "${var.subnet_grp_name}"
   }
}
