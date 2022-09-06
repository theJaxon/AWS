import boto3, os, json

ec2 = boto3.client('ec2', region_name="us-east-1")

def lambda_handler(event, context):
    print(f"Received event {json.dumps(event)}")
    instances=[event['detail']['instance-id']]
    ec2.start_instances(InstanceIds=instances)
    print(f'Protocted instance was stopped - Starting instance {instances}')