data "template_file" "install_script" {
  template = "${file("init.sh")}"
}
resource "aws_instance" "covenant-server" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.allow_connections_covenant.id}"]
  /* Specify SSH Key Name for login */
  key_name = "${var.ssh_key_name}"
  /* Include Bash file and execute */
  user_data = "${data.template_file.install_script.rendered}"
  tags = {
    Name = "covenant-server"
  }

  /* This local exec is just for convenience and opens the ssh sessio. */
  provisioner "local-exec" {
    command = "echo putty -ssh ubuntu@${aws_instance.covenant-server.public_ip} 22 -i '${var.ssh_key_path}'"
  }
}

