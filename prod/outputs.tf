output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "app_server_id" {
  value = aws_instance.app_server.id
}

output "app_server_public_dns" {
  value = aws_instance.app_server.public_dns
}