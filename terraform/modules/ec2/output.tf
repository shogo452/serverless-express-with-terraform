output "instance_id" {
  description = "value of the EC2 instance ID"
  value       = aws_instance.main.id
}

output "instance_public_ip" {
  description = "value of the EC2 instance public IP"
  value       = aws_instance.main.public_ip
}

output "root_block_device_volume_id" {
  description = "value of the EC2 root block device volume ID"
  value       = aws_instance.main.root_block_device[0].volume_id
}
