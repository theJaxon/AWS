### TWO_EC2s
- CloudFormation Template to Spin up 2 EC2 instances 

### lambda-role
- Allows Starting, Stopping EC2 instances 

### instance_start
- Lambda function to start EC2 instances
- The function needs to have an environment variable named `EC2_INSTANCES` that contains a comma seperated list of the EC2 instance IDs that need to be started

### instance_stop
- Lambda function to stop EC2 instances
- The function needs to have an environment variable named `EC2_INSTANCES` that contains a comma seperated list of the EC2 instance IDs that need to be stopped

### instance_protect
- Relies on AWS EventBridge rule that should be configured to watch EC2 stop events
- EventBridge should invoke instance_protect lambda function so that stopped ec2 instances get back to be up and running
