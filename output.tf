output "public_ip" {
    value = "${aws_instance.hello-world.public_ip}"
    description = "The public IP of the web server"
}