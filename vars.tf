variable "AWS_ACCESS_KEY"{
type=string
}
variable "AWS_SECRET_KEY"{
type=string
}
variable "AWS_SESSION_TOKEN"{
type=string
}
variable "AWS_REGION"{
 default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
 default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
 default = "mykey.pub"
}
