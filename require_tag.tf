resource "aws_iam_policy" "require_tagging_policy" {
  name        = "RequireTaggingPolicy"
  description = "Policy to require tagging for EC2 instances"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RequireTagging",
            "Effect": "Deny",
            "Action": [
                "ec2:RunInstances",
                "ec2:CreateTags"
            ],
            "Resource": "arn:aws:ec2:*:*:instance/*",
            "Condition": {
                "Null": {
                    "aws:RequestTag/Environment": "true"
                }
            }
        }
    ]
}
EOF
}

