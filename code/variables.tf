variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-053b0d53c279acc90"  # trying with default Ubuntu 20.04 in us-east-1 since we disabled this in our console
}

variable "key_name" {
  default = "Gdsd_Team4_Key"
}

variable "rds_endpoint" {
  default = "team4-db.ck1s0emywc4t.us-east-1.rds.amazonaws.com"
}

variable "s3_bucket" {
  default = "gdsd-project-summer-2025"
}