
provider "aws" {
 
}

resource "aws_instance" "tf_ubuntu" {
  ami           = "ami-0a1f442aef5d95cfd"
  instance_type = "t3.micro"

}
