output "ec2_publc_ip" {
    description = "Print out the public IP address of deployed instance"
    value = aws_instance.dev_ec2_node.public_ip
}