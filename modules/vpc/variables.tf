variable "env" {
   type = string
   description = "Environment (dev/prod)"
}

variable "vpc_region" {
   description = "Region where vpc will be created"
}

variable "enable_dns_hostnames" {
   default = true
   description = "Enable DNS hostnames in VPC"
   type = bool
}

variable "map_public_ip_on_launch" {
   description = "Indicates if instances will be allocated public IPs"
   type = bool
   default = true
}

variable "subnets_availability_zone" {
   type = list(string)
   default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
}

variable "vpc_name" {
   description = "VPC name"
   default = "fruitbox-vpc"
}

variable "vpc_cidr_block" {
   description = "VPC CIDR block"
   default = "10.0.0.0/26"
}

variable "public_subnet_name" {
   description = "Public subnet name"
   default = "fruitbox-public-subnet"
}

variable "public_subnet_cidr_block" {
   description = "Public subnet CIDR block"
   default = "10.0.0.0/28"
}

variable "private_subnet1_name" {
   description = "Private subnet 1 name"
   default = "fruitbox-private-subnet1"
}

variable "private_subnet1_cidr_block" {
   description = "Private subnet 1 CIDR block"
   default = "10.0.0.16/28"
}

variable "private_subnet2_name" {
   description = "Private subnet 2 name"
   default = "fruitbox-private-subnet2"
}

variable "private_subnet2_cidr_block" {
   description = "Private subnet 2 CIDR block"
   default = "10.0.0.32/28"
}

variable "private_subnet3_name" {
   description = "Private subnet 3 name"
   default = "fruitbox-private-subnet3"
}

variable "private_subnet3_cidr_block" {
   description = "Private subnet 3 CIDR block"
   default = "10.0.0.48/28"
}

variable "internet_gw_name" {
   description = "Internet gateway name"
   default = "fruitbox-igw"
}

variable "nat_gw_name" {
   description = "Nat gateway name"
   default = "fruitbox-nat-gw"
}

variable "public_rt_name" {
   description = "Public route table name"
   default = "fruitbox-public-rt"
}

variable "private_rt_name" {
   description = "Private route table name"
   default = "fruitbox-private-rt"
}

variable "igw_destination_cidr_block" {
   description = "Destination for internet gateway routes"
   default = "0.0.0.0/0"
}

variable "ngw_destination_cidr_block" {
   description = "Destination for nat gateway routes"
   default = "0.0.0.0/0"
}

variable "subnet_grp_name" {
   description = "Subnet group name"
   default = "fruitbox-subnet-grp"
}