terraform {
  backend "s3" {
    bucket = "myawsstatebucket"
    key    = "state"
    region = "us-east-1"
    dynamodb_table = "backendtable"
  }
}
