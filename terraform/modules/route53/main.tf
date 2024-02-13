resource "aws_route53_zone" "main" {
  name    = var.zone_name
  comment = var.comment
  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "rds_main_host_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.rds_main_host_alias_name
  type    = "CNAME"
  ttl     = 60
  records = [var.rds_writer_endpoint]
}

resource "aws_route53_record" "rds_replica_host_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.rds_replica_host_alias_name
  type    = "CNAME"
  ttl     = 60
  records = [var.rds_reader_endpoint]
}

resource "aws_route53_record" "elasticache_primary_host_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.elasticache_primary_host_alias_name
  type    = "CNAME"
  ttl     = 60
  records = [var.elasticache_primary_endpoint]
}

resource "aws_route53_record" "elasticache_reader_host_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.elasticache_reader_host_alias_name
  type    = "CNAME"
  ttl     = 60
  records = [var.elasticache_reader_endpoint]
}
