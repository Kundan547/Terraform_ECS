# Create Key Pair
resource "aws_key_pair" "bastion_key" {
  key_name   = "${var.env}-bastion-key"
  public_key = file(var.public_key_path)

  tags = {
    Name        = "${var.env}-bastion-key"
    Environment = var.env
  }
}
