# literate-funicular

Code Test.

This repository contains all the answers to the provided test paper.
All the practical are targeted at a AWS environment with application hosted in an EC2 instance.

## Directory - assessment-questions

Answers for the 10 questions

## Directory - jenkins

Jenksins files for infrastructure resource creation and application deployment

**deployment** - Deploy a python based flask application

**terraform/application** - Deploy the application resources

**terraform/network** - Deploy the network resources

## Directory - terraform

**terraform/application** - Application resources (EC2, SG, ALB, S3)

**terraform/network** - Network resources (VPC, Subnets, RT, NACL, NAT, IGW, VPC Endpoint)

Note - This configuration assumes that the user has the following resource already created in with AWS

- IAM User for Terraform -> User with necessary permissions to create all the resources.
- IAM Role for EC2 -> EC2 instance IAM role with permission for SSM and access the S3 bucket.
- EC2 Key Pair -> Key to access the EC2 instance.
- DNS Configuration -> Route 53 or any other DNS service pointing to the ALB as a CNAME record.
- Certificate -> AWS provided or uploaded certificate available in certificate manager in AWS.

## Directory - test-app

Simple flask application with a login function and the the ability to upload the files to S3 bucket. Poetry is used for dependency management.

Note -> The following article was used to create the base functionality of the application.

<https://www.digitalocean.com/community/tutorials/how-to-add-authentication-to-your-app-with-flask-login>
