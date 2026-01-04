# cloud_computing_submission

Project done by:

- Pavithra Purushothaman - MatrikelNummer: 1535949  
- Logeshwari Purushothaman - MatrikelNummer: 1536313

-----

We currently have a web app we created in our GDSD class, so we tried to deploy that application in AWS.

## What we did in this project:
1. We already had an EC2 instance running, but we terminated it and created a new one (count = 1) to stay within the free tier.
2. While running the EC2 instance, we added a step to automatically start our web app’s backend.
3. We used our existing S3 bucket to host the frontend part of the web app for testing.
4. In the web app, we used `boto3` to upload images from the frontend to S3 and store paths in the database.
5. We set up CloudWatch to monitor how many API requests hit our backend and created an alarm if more than 100 requests happen in 5 minutes so we can be aware and stay within the free tier's 1786 requests in our app.
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