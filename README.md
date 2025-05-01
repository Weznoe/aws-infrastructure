# AWS Engagement Ready Program - Infrastructure Capstone

### Objectives
1. Build an environment to run Terraform
1. Install the Terraform software and ensure it works properly
1. Test the environment by creating a simple virtual machine
1. Build a website similar to the Space Invaders site you built in class by resuing modules
1. Put a copy of your code in Git, then destroy the infrastructure; leave the environment intact

### Environment

1. Create an AWS access key pair.
    1. Navigate to the `IAM` service.
    1. Select the `Users` link from the left.
    1. Select your user.
    1. Select the `Security Credentials` tab, then scroll down to `Access keys` and select `Create access key`.
    1. Select the `CLI` use case and check the confirmation disclaimer at the bottom, then select `Next`.
    1. Select `Create access key`.
    1. Select `Download .csv file` and save this file for later.
1. Create an EC2 Instance and connect to it.
    1. Login to the [Aws Management Console](https://console.aws.amazon.com/).
    1. Navigate to the EC2 service.
    1. Select `Launch Instance`.
    1. In the `Name` field, enter a name for this instance (ex. `deploy-env`).
    1. Under the `Key pair (login)` select `Proceed without a key pair (Not recommended)`
    1. Leave the defaults for everything else.
    1. Select `Launch Instance`.
    1. Wait for the instance to launch, then navigate to the launched instance and select `Connect`.
    1. In the `Connect to instance` screen, leave the defaults and select `Connect`.
1. Download this repo.
    1. `cd ~`
    1. `git clone https://github.com/Weznoe/aws-infrastructure.git`
1. Install your environment tools.
    1. `cd ~/aws-infrastructure`
    1. `./setup_environment.sh`
    1. Input the AWS Access Key and AWS Secret Acces Key from the `.csv` file you downloaded earlier.
    1. Enter your region.
    1. Enter `json` for default output format.








    
