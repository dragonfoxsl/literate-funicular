# Running Jenkins Pipeline for the Terraform Network

## Jenkins Configuration

2 Node Architecture (Master + Worker)

In the worker node following software are installed.

- Terraform
- AWS CLI
- Git
- Infracost

Blue ocean Jenkins plugin will be installed as it provides a cleaner interface.

## Running Pipeline

### 1. Set The Parameter -> Infrastructure Version

![set parameter](./paramter-stage.png)

### 2. Validate The Parameter

![validate parameter](./validate-paramters-stage.png)

### 3. Download The Repository

![repo download](./download-repo-stage.png)

### 4. Initialize / Upgrade Terraform

![terraform init](./terraform-init-stage.png)

### 5. Validate Terraform Configuration

![terraform validate](./terraform-validate-stage.png)

### 6. Generate Terraform Plan

![terraform plan](./terraform-plan-stage.png)

### 6.1 Upload The Generate Plan to S3 (Artifact)

![terraform plan s3 upload](./terraform-plan-s3-stage.png)

### 7. Identify Cost Changes Using InfraCost

![infracost](./infracost-stage.png)

### 8. Request User Approval

![user approval](./approval-stage.png)

### 9. Resource Creation

![terraform apply](./terraform-apply-stage.png)

Note -> Please note that the pipeline was manually aborted at this stage.

### 10. Slack Notification (Aborted Message)

![slack notification](./slack-notification.png)
