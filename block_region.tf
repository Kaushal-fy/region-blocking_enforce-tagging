resource "aws_iam_policy" "block_unused_regions_policy" {
  name        = "BlockUnusedRegionsPolicy"
  description = "Policy to block unused regions"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "BlockUnusedRegions",
            "Effect": "Deny",
            "Action": "*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "us-west-2"
                    ]
                }
            }
        }
    ]
}
EOF
}
