resource "aws_vpc" "prod_vpc" {
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = "true"
}

resource "aws_subnet" "prod_subnet_public" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "172.16.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.AWS_REGION}a"
}

resource "aws_subnet" "prod_subnet_private_1" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "172.16.1.0/24"
    availability_zone = "${var.AWS_REGION}b"
}

resource "aws_subnet" "prod_subnet_private_2" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "172.16.2.0/24"
    availability_zone = "${var.AWS_REGION}c"
}

resource "aws_internet_gateway" "prod_igw" {
    vpc_id = aws_vpc.prod_vpc.id
}

resource "aws_route_table" "prod_rt" {
    vpc_id = aws_vpc.prod_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prod_igw.id
    }
}

resource "aws_route_table_association" "prod_rta_public_subnet" {
    subnet_id = aws_subnet.prod_subnet_public.id
    route_table_id = aws_route_table.prod_rt.id
}
