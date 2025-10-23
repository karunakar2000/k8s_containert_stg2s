resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  zone_id = "${var.zone_id}"
  name    = "${each.key}.${var.domain_name}" # mongodb.dso86s.xyz
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}

locals {
  frontend_index = index(var.ec2, "frontend")
}

# resource "aws_route53_record" "frontend_root" {
#   zone_id = var.zone_id
#   name    = var.domain_name     # naked domain -> dso86s.xyz
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.terraform[local.frontend_index].public_ip]
#   allow_overwrite = true
# }


# name = var.domain_name → creates record for the root domain (dso86s.xyz), not for a subdomain.
# frontend_index = index(var.ec2, "frontend") → dynamically finds which instance is “frontend”.
# records = [aws_instance.terraform[local.frontend_index].public_ip] → uses that instance’s public IP.
# allow_overwrite = true → ensures Terraform can update the record if the IP changes.