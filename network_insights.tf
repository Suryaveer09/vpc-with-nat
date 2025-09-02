resource "aws_ec2_network_insights_path" "home_to_ec2" {
  # TIP: resource references can't contain hyphens; ensure your instance name uses underscores.
  source   = aws_instance.Windows-Instance.id
  protocol = "tcp"

  filter_at_source {
    destination_address = local.home_ip

    destination_port_range {
      from_port = 80
      to_port   = 80
    }
  }

  tags = { Name = "Home_to_EC2" }
}

resource "aws_ec2_network_insights_analysis" "home_to_ec2_analysis" {
  network_insights_path_id = aws_ec2_network_insights_path.home_to_ec2.id
  wait_for_completion      = true
}
