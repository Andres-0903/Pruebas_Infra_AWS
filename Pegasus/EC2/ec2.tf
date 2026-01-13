###
#Datos instancia Ec2
###


###SNS Topic Subscription

resource "aws_sns_topic" "sns_ec2" {
  name = "sns_ec2_alerts"
}

resource "aws_sns_topic_subscription" "sns_ec2_alerts" {
  topic_arn = aws_sns_topic.sns_ec2.arn
  protocol  = "email"
  endpoint  = "arenasandres7@gmail.com"
}

resource "aws_instance" "public_instance" {
  for_each                    = var.instancias
  ami                         = var.ec2_specs["ami"]
  instance_type               = var.ec2_specs["type"]
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = data.aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.SG_Allow_SSH_HTTP.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  user_data                   = file("${path.module}/scripts/cw-agent.sh")
  user_data_replace_on_change = true

  tags = {
    Name = each.key
  }
}






