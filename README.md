AWS Serverless Visitor Counter Application (Terraform)
Overview
This project deploys a serverless visitor counter application on AWS using Terraform.

The application uses Amazon API Gateway to invoke an AWS Lambda function, which interacts with Amazon DynamoDB to store and retrieve visitor counts.

Architecture
API Gateway │ ▼ Lambda Function │ ▼ DynamoDB

AWS Services Used
Amazon API Gateway
AWS Lambda
Amazon DynamoDB
AWS IAM
Terraform
Project Structure
. ├── api-gateway.tf ├── lambda.tf ├── iam.tf ├── dynamodb.tf ├── outputs.tf ├── variables.tf ├── provider.tf └── README.md

Features
Serverless architecture
Infrastructure as Code (IaC)
DynamoDB backend storage
API Gateway integration
IAM Least Privilege Design
Terraform-managed deployment
Deployment
Initialize Terraform:

terraform init
