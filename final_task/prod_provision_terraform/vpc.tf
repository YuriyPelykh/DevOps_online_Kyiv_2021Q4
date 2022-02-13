resource "aws_vpc" "prod_vpc" {
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
}

resource "aws_subnet" "prod_subnet" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "172.16.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "prod_subnet_1" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "172.16.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"
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
    subnet_id = aws_subnet.prod_subnet.id
    route_table_id = aws_route_table.prod_rt.id
}
