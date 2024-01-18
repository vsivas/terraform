 -------------
 create keypair before executing this code/module
---------------------------------
 command in bash: ssh-keygen -t rsa
This module focus on Provisioners (File, Remote Exec, Local-exec)
It has end to end scenario where 
1. create infra
2. TF Connects to EC2 via Keypair
3. TF Copy python file/app(via File Provisioner) 
4. Install all packages(Python, pip, flask etc (via Remote-Exec provisioner)
5. TF Deploys and Runs python application 

Infra : 
    1. VPC
    2. Subnet(and cidr)
    3. Route table
    4. Route Table association to Subnet
    5. IGw (for public access)
    6. EC2
    7. Key pair(tf to login ec2)
    8. Security group

appp.py file is copied to /home/ubuntu

Provisioner  Local-exec - runs command locally 
 ex: when a vm is created, then this command can get ipaddress of that vm and write to some file/terminal output

