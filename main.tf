resource "aws_instance" "web" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type

  tags = {
    Name = "terraform-cloud-demo"
  }

}