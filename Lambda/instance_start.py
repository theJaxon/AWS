import boto3, os, json

ec2 = boto3.client('ec2', region_name="us-east-1")

def lambda_handler(event, context):
    instances=os.environ['EC2_INSTANCES'].split(",")
    ec2.start_instances(InstanceIds=instances)
    print(f'Started {instances}')