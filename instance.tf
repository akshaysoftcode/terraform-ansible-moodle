resource "aws_instance" "akshay-ec2" {
 ami = "ami-09a56048b08f94cdf"
 instance_type = "t2.micro"
 # the VPC subnet
 subnet_id = aws_subnet.main-public-1.id
 # the security group
 vpc_security_group_ids = [aws_security_group.allow-ssh.id]
 # the public SSH key
 key_name = aws_key_pair.akshaykey.key_name
 tags = {
 Name = "akshay-ec2"
 }

}
