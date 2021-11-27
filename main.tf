data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
resource "aws_key_pair" "mykey" {
  key_name = "terraform_GAM"
  public_key = "${file("${path.root}/mykey.pub")}"
}

resource "aws_instance" "hello-world" {
 ami = data.aws_ami.ubuntu.id
 instance_type = "t2.micro"
 vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
 key_name      = aws_key_pair.mykey.key_name
 tags = {
	 Name = "GAM Terraform"
 }
 user_data = <<-EOF
     #!/bin/bash
     echo "Hello, World" > index.html
     nohup busybox httpd -f -p 8080 &
 EOF
  lifecycle {
    create_before_destroy = true
  }
} 