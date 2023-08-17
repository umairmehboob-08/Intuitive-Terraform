resource "aws_subnet" "public" {
  count = var.count

  cidr_block = var.subnet_cidr[count.index]
  vpc_id     = var.vpc_id

  tags = {
    Name = "Public-Subnet-${count.index}"
  }
}