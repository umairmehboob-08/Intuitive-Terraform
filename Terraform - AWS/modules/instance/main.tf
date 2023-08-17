resource "aws_instance" "ec2_instance" {
  count = var.instance_count

  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  subnet_id     = var.subnet_ids[count.index]

  root_block_device {
    volume_type = "gp2"
    volume_size = 20
  }

  ebs_block_device {
    device_name = "/dev/xvdf"
    volume_type = "gp2"
    volume_size = 20
  }

  tags = {
    Name = "EC2-Instance-${count.index}"
  }
}