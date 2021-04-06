variable "google_pem" {
  type        = string
  description = "Google Credentials"
  sensitive   = true
}

variable "google_creds" {
  type        = string
  description = "Google Credentials"
  sensitive   = true
}

variable "google_test" {
  type        = string
  description = "Google Test Var"
  default     ="test"
}
