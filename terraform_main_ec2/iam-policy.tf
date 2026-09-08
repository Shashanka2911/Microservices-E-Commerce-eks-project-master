# ============================================================
# Custom EKS Policy
# ============================================================

resource "aws_iam_policy" "eks_policy" {
  name        = "eks-policy"
  description = "Custom policy for EKS access"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = "eks:*"
        Resource = "*"
      }
    ]
  })
}


# ============================================================
# Custom EKS Policy Attachment
# ============================================================

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}


# ============================================================
# Administrator Access
# WARNING:
# Gives the EC2 instance full AWS access.
# Use only for learning/testing.
# ============================================================

resource "aws_iam_role_policy_attachment" "administrator_access" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


# ============================================================
# EC2 Full Access
# ============================================================

resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


# ============================================================
# EKS Cluster Policy
# ============================================================

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


# ============================================================
# EKS Worker Node Policy
# ============================================================

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


# ============================================================
# CloudFormation Full Access
# ============================================================

resource "aws_iam_role_policy_attachment" "cloudformation_full_access" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}


# ============================================================
# IAM Full Access
# ============================================================

resource "aws_iam_role_policy_attachment" "iam_full_access" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}