# Final project notes  

## Part 1. Jenkins installation and configuration  
1. EC2 instance was created on AWS.  
2. Jenkins installation was performed as follows:  
  1. **wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -**  
  2. **sudo nano /etc/apt/sources.list**  
	  string added: **deb https://pkg.jenkins.io/debian-stable binary/**  
  3. **sudo apt-get update**  
  4. **java -version**  
  5. **sudo apt-get install openjdk-11-jdk**  
  6. **sudo apt-get install jenkins**  
  7. **service jenkins status**  
  8. **sudo cat /var/lib/jenkins/secrets/initialAdminPassword**  
3. Maven installed accordingly to instruction: https://maven.apache.org/install.html
4. Because of unsuccessful Jenkins test job (detailed job's description will be later) ending due to lack of **t2.micro** computing resources, a separate build agent was configured on Home-PC virtual machine:  


## Part 2. CI pipeline with GitHub Webhook and Maven jobs

## Part 3. CI pipeline with Maven Integration plugin

## Part 4. Infrastructure creation with Terraform  
1. All Terraform documentation:  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/  
2. 
