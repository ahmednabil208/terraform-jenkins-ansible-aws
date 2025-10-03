
# Creating an AWS Secret for API Service User
# Store the private key securely in Secrets Manager
resource "aws_secretsmanager_secret" "my_secret" {
  name                    = "secret_manager"
  description             = "Service Account Username for the API"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id     = aws_secretsmanager_secret.my_secret.id
  secret_string = tls_private_key.mykey.private_key_pem
}


