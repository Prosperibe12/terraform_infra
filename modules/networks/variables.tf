variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/26"
}

variable "vpc_name" {
  type        = string
  default     = "fruitbox_vpc"
}

variable "private_subnet_cidr" {
   type = string
   default = "10.0.0.0/27"
}

variable "private_subnet_availability_zones" {
   type        = string
   default     = "us-east-1a"
}

variable "private_subnet_name" {
   type = string
   default = "fruitbox_private_subnet"
}

variable "private_subnet_map_public_ip_on_launch" {
   type        = bool
   default     = false
}

variable "private_route_table" {
   type        = string
   default     = "fruitbox_private_rt"
}

variable "fruitbox_nat_gateway_name" {
   type        = string
   default     = "fruitbox_nat_gateway"
}

variable "nat_gateway_destination_cidr_block" {
   type        = string
   default     = "0.0.0.0/0"
}


variable public_subnet_cidr {
   type = string
   default = "10.0.0.32/27"
}

variable public_subnet_name {
   type = string
   default = "fruitbox_public_subnet"
}

variable "public_subnet_availability_zones" {
   type        = string
   default     = "us-east-1b"
}

variable "public_subnet_map_public_ip_on_launch" {
   type        = bool
   default     = true
}

variable "public_route_table" {
   type        = string
   default     = "fruitbox_public_rt"
}

variable "internet_gateway_name" {
   type        = string
   default     = "fruitbox_internet_gateway"
}

variable "internet_gt_destination_cidr_block" {
   type        = string
   default     = "0.0.0.0/0"
}