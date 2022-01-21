# Task 9.1 Jenkins  

## 1. Simple Jenkins job (lecture 1):  
Practice of simple job creation in Jenkins:  
![Screen1](./task_images/Screenshot_1.png)  
![Screen2](./task_images/Screenshot_2.png)  
![Screen3](./task_images/Screenshot_3.png)  

##2. Deploy with Jenkins (lecture 2):   
### Case of "manual" deploy:  
1. Simple job with output to the local file:  
![Screen4](./task_images/Screenshot_4.png)  
2. Result:  
![Screen5](./task_images/Screenshot_5.png)  
3. Key generation:  
![Screen6](./task_images/Screenshot_6.png)  
4. Test of connection to other machine:  
![Screen7](./task_images/Screenshot_7.png)  
5. Public key copied:  
![Screen8](./task_images/Screenshot_8.png)  
6. Setting folder rights on remote machine VM2:  
![Screen9](./task_images/Screenshot_9.png)  
7.**id_rsa** key should be copied to the Jenkins' directory with a correct ownership:  
![Screen10](./task_images/Screenshot_10.png)  
8. Deployment task added to the job in Jenkins:  
![Screen11](./task_images/Screenshot_11.png)  
9. Result of deploy:  
![Screen12](./task_images/Screenshot_12.png)  
![Screen13](./task_images/Screenshot_13.png)  

### Pipeline Git-Jenkins-Deployment Server:  
1. Key-pair generated on a Jenkins' machine:  
![Screen14](./task_images/Screenshot_14.png)  
![Screen14b](./task_images/Screenshot_14b.png)  
2. GitHub key configuration:  
![Screen15](./task_images/Screenshot_15.png)  
Connection test:  
![Screen16](./task_images/Screenshot_16.png)  
3. Source Code Management configuration in Jenkins job:  
![Screen17](./task_images/Screenshot_17.png)  
Adding of credentials:  
![Screen18](./task_images/Screenshot_18.png)  
4. Adding Build Triggers for job:  
![Screen19](./task_images/Screenshot_19.png)  
![Screen19b](./task_images/Screenshot_19b.png)  
5. While no commits were pushed to GitHub we got an error:  
![Screen20](./task_images/Screenshot_20.png)  
6. Index-file was created and pushed to the Git:  
![Screen22](./task_images/Screenshot_22.png)  
7. Now builds run normally:  
![Screen21](./task_images/Screenshot_21.png)  
![Screen23](./task_images/Screenshot_23.png)  
8. Refreshed page on deploy server now looks like:  
![Screen24](./task_images/Screenshot_24.png)  

### Pipeline Git-Jenkins-Deployment Server using AWS EC2 instances:  
1. Two ubuntu machines were created in AWS. Jenkins and Java 11 were installed on one of them (Jenkins Server), and Apache on a second (Deploment Server):  
![Screen25](./task_images/Screenshot_25.png)  
2. Key-pair generated on a Jenkins' machine:  
![Screen26](./task_images/Screenshot_26.png)  
![Screen27](./task_images/Screenshot_27.png)  
3. GitHub key configuration:  
![Screen28](./task_images/Screenshot_28.png)  
4. Source Code Management configuration in Jenkins job:  
![Screen29](./task_images/Screenshot_29.png)  
Adding of credentials was made as in previous task with local Jenkins.  
5. Adding Build Triggers for job - **GitHub hook trigger for GITScm polling**:  
![Screen30](./task_images/Screenshot_30.png)  
6. Build section:  
![Screen31](./task_images/Screenshot_31.png)  
7. Jenkins' SSH public key should be added to the Deployment Server to be accessible from Jenkins via SCP:  
![Screen32](./task_images/Screenshot_32.png)  
8. Job deploys index.html file to Deployment Server - we can see the same page, but hosted on AWS EC2 instance:  
![Screen33](./task_images/Screenshot_33.png)  
8. Now make some changes in the index.html file and push it to GitHub:  
![Screen34](./task_images/Screenshot_34.png)  
9. Refreshed page on Deployment Server now looks like:  
![Screen35](./task_images/Screenshot_35.png)  

### Jenkins installation commands on Ubuntu:
**wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -**  
**sudo nano /etc/apt/sources.list**  
	**deb https://pkg.jenkins.io/debian-stable binary/**  
**sudo apt-get update**  
**java -version**  
**sudo apt-get install openjdk-11-jdk**  
**sudo apt-get install jenkins**  
**service jenkins status**  
**sudo cat /var/lib/jenkins/secrets/initialAdminPassword**  

### Jenkins deploy conditions:  
1) We have to use -o StrictHostKeyChecking=no  
**scp -v -o StrictHostKeyChecking=no index.html ypelykh@192.168.101:/var/www/html**  
2) Wehave to copy id_rsa to **/var/lib/jenkins/.ssh**  
3)The **/var/lib/jenkins/.ssh** directory and files inside of it should be owned by **jenkins**  
