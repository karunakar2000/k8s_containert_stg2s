resource "aws_route53_record" "roboshop" {
  count = length(var.ec2)
  zone_id = "${var.zone_id}"
  name    = "${var.ec2[count.index]}.${var.domain_name}" # mongodb.dso86s.xyz
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}


