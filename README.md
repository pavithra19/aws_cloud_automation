A personal learning project demonstrating core AWS cloud concepts using EC2, S3, and CloudWatch. The project focuses on deploying a simple web application backend, hosting a frontend on S3, monitoring API usage with CloudWatch, and staying within AWS Free Tier limits.

# Project Overview

This project simulates a simple cloud-hosted web application and focuses on practical AWS usage rather than production-level scaling.

## Key Implementations

1. I already had an EC2 instance running, but I terminated it and created a new one (count = 1) to stay within the free tier.
2. While running the EC2 instance, I added a step to automatically start the web app’s backend.
3. I used the existing S3 bucket to host the frontend part of the web app for testing.
4. In the web app, I used `boto3` to upload images from the frontend to S3 and store paths in the database.
5. I set up CloudWatch to monitor how many API requests hit the backend and created an alarm if more than 100 requests happen in 5 minutes so I can be aware and stay within the free tier's 1786 requests in the app.
6. To see logs and alarms then go to AWS CloudWatch: Logs -> Log Groups -> /team4/app_logs.

---

## Execution steps:
1. Open the project folder.

2. If Terraform is not installed, install it:
   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform

   terraform -version #Checking installation is done

3. If terraform already available then
    ```bash
    terraform init
    terraform import aws_instance.app_server i-08f8de8988d5f1018 # old instance's id.
    terraform plan
    terraform apply

## Contributors
[Logeshwari Purushothaman](https://github.com/Logeshwari-Purushothaman)
