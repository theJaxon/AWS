### [CloudWatch Agent Config File](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Agent-commandline-fleet.html)
- Generated with the interactive CloudWatch Agent config Wizard 

```bash
# Start the config wizard
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

- File is saved by default to `/opt/aws/amazon-cloudwatch-agent/bin/config.json` and you're offered to store it as well in SSM Parameter Store
- To load the config file non interactively you can use `/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:configuration-file-path` 
