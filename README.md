# AWS Engagement Ready Program - Infrastructure Capstone
## Table of Contents

- [Objectives](#objectives)

- [Environment](#environment)

- [Test VM](#test-vm)

- [Space Invaders Site](#space-invaders-site)

### Objectives
1. Build an environment to run Terraform
1. Install the Terraform software and ensure it works properly
1. Test the environment by creating a simple virtual machine
1. Build a website similar to the Space Invaders site you built in class by resuing modules
1. Put a copy of your code in Git, then destroy the infrastructure; leave the environment intact

### Environment

##### Create an AWS access key pair
1. Navigate to the `IAM` service.
1. Select the `Users` link from the left.
1. Select your user.
1. Select the `Security Credentials` tab, then scroll down to `Access keys` and select `Create access key`.
1. Select the `CLI` use case and check the confirmation disclaimer at the bottom, then select `Next`.
1. Select `Create access key`.
1. Select `Download .csv file` and save this file for later.

#####  Create an EC2 Instance and connect to it
1. Login to the [AWS Management Console](https://console.aws.amazon.com/).
1. Navigate to the EC2 service.
1. Select `Launch Instance`.
1. In the `Name` field, enter a name for this instance (ex. `deploy-env`).
1. Under the `Key pair (login)` select `Proceed without a key pair (Not recommended)`
1. Leave the defaults for everything else.
1. Select `Launch Instance`.
1. Wait for the instance to launch, then navigate to the launched instance and select `Connect`.
1. In the `Connect to instance` screen, leave the defaults and select `Connect`.

##### Download this repo
1. `cd ~`
1. `git clone https://github.com/Weznoe/aws-infrastructure.git`

##### Install your environment tools
1. `cd ~/aws-infrastructure`
1. `./setup_environment.sh`
1. Input the AWS Access Key and AWS Secret Acces Key from the `.csv` file you downloaded earlier.
    1. Enter your region.
    1. Enter `json` for default output format.

### Test VM
1. `cd ~/aws-infrastructure/test_vm`
1. If you want to use your own input variables, edit the `terraform.tfvars` file.
1. `terraform init`
1. `terraform apply -auto-approve`
    - This should print the public ip address of the created VM.
1. In the AWS Management Console, verify that the VM exists in the expected region.
1. `terraform destroy -auto-approve`

### Space Invaders Site
1. `cd ~/aws-infrastructure/space_invaders`
1. If you want to use your own input variables, edit the `terraform.tfvars` file.
1. `terraform init`
1. `terraform apply -auto-approve`
    - This should print the DNS address of the website.
1. Visit the DNS address in your browser.
    - It may take a few minutes for the server to go online.
1. `terraform destroy -auto-approve`








    
