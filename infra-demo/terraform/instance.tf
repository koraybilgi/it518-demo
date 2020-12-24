data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["*ubuntu*20.04*amd64*server*"]
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file(var.aws_pub_location)
}


resource "aws_instance" "db" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  key_name = aws_key_pair.deployer.key_name
  subnet_id = aws_subnet.main.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.mysql.id,
    aws_security_group.outbound.id,
  ]
}


resource "aws_instance" "webhost" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"
  key_name = aws_key_pair.deployer.key_name
  subnet_id = aws_subnet.main.id
  associate_public_ip_address = true


  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.outbound.id,
  ]
}

/*
resource null_resource "ansible_exec" {
  depends_on = [aws_instance.db, aws_instance.webhost]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -u ubuntu --private-key '${var.aws_pem_location}' -i '${aws_instance.db.public_ip},'  -e '{target: ${aws_instance.db.public_ip}}' ../ansible/db.yml"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -u ubuntu --private-key '${var.aws_pem_location}' -i '${aws_instance.webhost.public_ip},' -e '{target: ${aws_instance.webhost.public_ip}, db_address: ${aws_instance.db.private_ip}}' ../ansible/webhost.yml"
  }
}
*/