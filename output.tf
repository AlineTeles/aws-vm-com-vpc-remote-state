output "vm_ip" {
  description = "IP da VM criada na aws"
  value       = aws_instance.vm.public_ip
}