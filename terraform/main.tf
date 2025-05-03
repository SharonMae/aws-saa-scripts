# Terraform equivalent of CI/CD pipeline for automatic deployment to EC2

# This version assumes:
# - GitHub as source repo
# - S3 for artifact storage
# - CodeDeploy for deployment to EC2
# - IAM roles created inline

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "artifact-bucket-${terraform.workspace}-${data.aws_region.current.name}"
}

data "aws_region" "current" {}

resource "aws_codedeploy_app" "webapp" {
  name = "WebApp"
  compute_platform = "Server"
}

resource "aws_iam_role" "codedeploy_role" {
  name = "CodeDeployServiceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "codedeploy.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "CodeDeployPolicy"
  role = aws_iam_role.codedeploy_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["ec2:*", "s3:*", "cloudwatch:*"],
      Resource = "*"
    }]
  })
}

resource "aws_codedeploy_deployment_group" "webapp_group" {
  app_name              = aws_codedeploy_app.webapp.name
  deployment_group_name = "WebAppDeployGroup"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      value = "WebServer"
      type  = "KEY_AND_VALUE"
    }
  }
}

resource "aws_iam_role" "codepipeline_role" {
  name = "CodePipelineServiceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "codepipeline.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "CodePipelinePolicy"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:*", "codebuild:*", "codedeploy:*", "iam:PassRole"],
      Resource = "*"
    }]
  })
}

# CodePipeline resource would go here with stages: Source (GitHub), Build (optional), Deploy (CodeDeploy)
# Note: GitHub token and details can be configured using secrets or variables
