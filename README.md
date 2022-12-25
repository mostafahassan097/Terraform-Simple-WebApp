# Deploy Simple NodeJs App on ECS That Connects to Rds Using Terraform

## Before you start you should have docker and terraform installed on your machine:

### - Install Terraform  ([Link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)).

## Provison Webserver Using Terraform
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

## to Delete Resources after provisoned  :
```sh
terraform destroy
```