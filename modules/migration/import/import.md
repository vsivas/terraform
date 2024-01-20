Scenario: Import existing resources from cloud into terraform
If we have existing resources on aws or any cloud which were created manually(via aws console) or via cloud formation.
Now we have started to terraform and we must tell terraform to recignise that resource and import into terraform.
Then we have to 
1. terraform plan -generate-config-out=generated_resources.tf
2. import command after running 

Read main.tf comments for more details

