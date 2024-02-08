resource "aws_s3_object" "main" {
  bucket = var.bucket_name
  key    = var.key
  source = data.archive_file.main.output_path
  etag   = filemd5(data.archive_file.main.output_path)
  lifecycle {
    ignore_changes = [
      etag,
      metadata
    ]
  }
}

data "archive_file" "main" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/latest.zip"
}
