resource "aws_instance" "web" {
    ami = "ami-0341d95f75f311023" 
    instance_type = "t2.micro"
    tags ={
        Name = "one" 
    }
  
}