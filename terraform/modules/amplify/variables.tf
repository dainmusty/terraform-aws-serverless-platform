variable "app_name" {
  description = "Amplify application name"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository URL"
  type        = string
}

variable "github_access_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "branch_name" {
  description = "GitHub branch name"
  type        = string
  default     = "main"
}

variable "frontend_build_spec" {
  description = "Amplify frontend build specification"
  type        = string
}

variable "tags" {
  description = "Tags for Amplify resources"
  type        = map(string)
  default     = {}
}

variable "get_student_api_url" {
  type = string
}

variable "post_student_api_url" {
  type = string
}