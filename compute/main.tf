data "aws_ami" "ubuntu_us_east_1" {
  most_recent = true
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Generate the SSH Key Pair
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS EC2 Key pair from public Key
resource "aws_key_pair" "my_dev_key" {
  key_name   = "my_tf_key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "${path.module}/my-terraform-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "my-ec2-instance" {
  ami = data.aws_ami.ubuntu_us_east_1.id
  instance_type = "t2.micro"
  key_name = "my_tf_key"
}