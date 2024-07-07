variable "bucket_arn" {
  type = string
}

variable "bukcet_id" {
  type = string
}

variable "ro_users" {
  type = list(string)
}

variable "rw_users" {
  type = list(string)
}
