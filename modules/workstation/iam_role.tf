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
    name = "${var.namespace}-s3-read-write-policy-${random_integer.id.result}"
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
    Name    = "s3-bucket-access-role"
    Project = var.namespace
  }
}

resource "aws_iam_instance_profile" "bucket_access" {
  name = "${var.namespace}-s3-read-write-profile-${random_integer.id.result}"
  role = aws_iam_role.bucket_access.name
  tags = {
    Name    = "s3-bucket-access-profile"
    Project = var.namespace
  }
}
