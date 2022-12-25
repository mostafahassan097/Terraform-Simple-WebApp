# Provison Webserver Using Terraform

## Before you start you should have terraform installed on your machine:

#### - Install Terraform  ([Link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)).
#### Make sure to configure aws credentials under $HOME/.aws/credentials or using command ```aws configure ``` 
* Clone The repo:
```sh
mkdir simple-webserver 
git@github.com:mostafahassan097/Terraform-Simple-WebApp.git 
git checkout feature/simple-web
```
- Run the following commands to deploy the terraform code: 
```sh
cd Terraform-Simple-WebApp
terraform init 
terraform apply 
```

## After Running Terraform Code  :

![App Screenshot](https://github.com/mostafahassan097/Terraform-Simple-WebApp/blob/feature/simple-web/Screenshots/1.png)
![App Screenshot](https://github.com/mostafahassan097/Terraform-Simple-WebApp/blob/feature/simple-web/Screenshots/2.png)

## Make sure to delete infra resources after provisioning:
```sh
terraform destroy
```
