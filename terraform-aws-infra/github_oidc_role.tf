# GitHub Actions OIDC Provider
resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # GitHub OIDC cert
}

# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_oidc_role" {
  name = "AkwadGithubActionsDeployRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:sub" = "repo:Akwad/nodejs-github-actions-ci-cd:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}

# Attach Permissions to the Role
resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.github_actions_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.github_actions_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

# Output the Role ARN for GitHub Secret
output "aws_role_arn" {
  description = "IAM Role ARN to use in GitHub Actions as AWS_ROLE_ARN secret"
  value       = aws_iam_role.github_actions_oidc_role.arn
}
