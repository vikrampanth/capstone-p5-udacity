# VPC & Subnet setup
aws cloudformation create-stack --stack-name Capstone-Infra --template-body file://aws/IaaCInfra.yml --parameters file://aws/IaaCInfra-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2

# EKS setup
aws cloudformation create-stack --stack-name Capstone-EKS-Server --template-body file://aws/EKSServers.yml --parameters file://aws/EKSServers-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
