resource "aws_key_pair" "akshaykey" {
 key_name = "akshaykey"
 public_key = file(var.PATH_TO_PUBLIC_KEY)
}
