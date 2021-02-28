locals {
  s3_policy = "${var.policy_dir}/amazon_s3_full_access.json"
  ec2_policy = "${var.policy_dir}/ec2_assume_role.json"
}

resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "s3_full_access_policy"
  description = "Grants an EC2 instance full permissions on S3 buckets."
  policy = file(local.s3_policy)
}

resource "aws_iam_role" "ec2_assume_role" {
  name = "ec2_assume_role"
  description = "Allow the EC2 instance to assume the role"
  assume_role_policy = file(local.ec2_policy)

  tags = {
    Name = "ec2_assume_role"
  }
}

# Instance profile is used to pass the created role to the EC2 instance
resource "aws_iam_instance_profile" "s3_full_access_profile" {
  name = "s3_full_access_profile"
  role = aws_iam_role.ec2_assume_role.name
}

resource "aws_iam_policy_attachment" "attach_s3_policy_to_ec2" {
  name       = "attach_s3_policy_to_ec2"
  roles      = [aws_iam_role.ec2_assume_role.name]
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
}