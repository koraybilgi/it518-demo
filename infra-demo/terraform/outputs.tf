output "webhost_public_ip" {
  value = aws_instance.webhost.public_ip
}

output "db_public_ip" {
  value = aws_instance.db.public_ip
}

output "db_private_ip" {
  value = aws_instance.db.private_ip
}