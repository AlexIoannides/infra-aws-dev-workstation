data "aws_s3_bucket" "data_storage" {
  bucket = var.bucket_name
}

resource "aws_iam_role" "s3_access_role" {
  name = "${var.namespace}-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  inline_policy {
    name = "s3-read-write-policy"
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Action = [
            "s3:GetObject",
            "s3:PutObject",
            "s3:DeleteObject",
            "s3:ListBucket"
          ],
          Resource = [
            "${data.aws_s3_bucket.data_storage.arn}",
            "${data.aws_s3_bucket.data_storage.arn}/*"
          ]
        }
      ]
    })
  }
}
