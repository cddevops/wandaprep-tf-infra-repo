resource "aws_instance" "wandaprep-web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = "subnet-09c86ffad65c55e64"
  tags = {
    Name = "wandaprep-web-server"
  }
}

resource "aws_instance" "wandaprep-app-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = "subnet-09c86ffad65c55e64"
  tags = {
    Name = "wandaprep-app-server"
  }
}

/* 
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

*/