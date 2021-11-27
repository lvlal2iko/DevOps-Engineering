variable "access_key" {
  description = "ilog AMI"
  default = "AKIA3JKBXCA4G3D4O7S5"
}

variable "secret_key" {
  default = "6hgVLJ0JalWym1CPt8aOI1ERVQnbvbjqJwmKpFSe"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}