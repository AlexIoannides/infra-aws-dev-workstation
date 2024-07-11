resource "aws_iam_instance_profile" "bucket_access" {
  name = "${var.namespace}-s3-access"
  role = aws_iam_role.bucket_access.name
  tags = {
    Name : var.namespace
  }
}

resource "aws_iam_role" "bucket_access" {
  name = "${var.namespace}-s3-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = [
            "ec2.amazonaws.com"
          ]
        },
        Action = [
          "sts:AssumeRole"
        ]
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

  tags = {
    Name : var.namespace
  }
}
