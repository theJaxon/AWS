### EC2-S3
- Fetch Latest Amazon AMI ID From the current Region using SSM
- Create an EC2 Instance with that AMI and the Key specified via Parameters
- Create S3 Bucket with a Random name

### CFN-INIT
```bash
# Useful Locations
/var/log/
  # Shows the output of all the commands used in user-data , great for user-data debugging
  cloud-init-output.log

  # Shows the output of cfn-init command
  cfn-init-cmd.log

  # Shows an overview of which desired state actions have taken place
  cfn-init.log


```