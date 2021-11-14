# Task 2.2  
 The theoretical bases were studied and practical experience of work with AWS cloud services was got:  
  - Creating a virtual private server (VPS) with Amazon Lightsail, ability to connect remotely through:  
    - Web terminal:  
    ![Screen1](./task_images/Screenshot_1.png)  
    - SSH client:  
    ![Screen2](./task_images/Screenshot_2.png)  
  - Deployment of servers through the AWS Management Console abd launching Amazon Elastic Compute Cloud (EC2) instances:  
  ![Screen3](./task_images/Screenshot_3.png)  
  ![Screen4](./task_images/Screenshot_4.png)  

  > Ubuntu Server 20.04 was chosen as the operating system instead of the recommended CentOS, as the latter is not available for free under Amazon Free Tier.  

  - Saving the state of the VM by making snapshots:  
  ![Screen5](./task_images/Screenshot_5.png)  
  - Creation of Elastic Block Store (EBS) instances, their connection to the existing EC2 and execution of the necessary settings in the VM's OS to make added EBS available for data storage:
  ![Screen6](./task_images/Screenshot_6.png)
  ![Screen7](./task_images/Screenshot_7.png)
  - Deploying an instance from a backup. For this:
    - an image was created from the Snapshots section based on a previously taken snapshot of the VM:
    ![Screen8](./task_images/Screenshot_8.png)
    - launched a new instance of EC2 from the created image:
    ![Screen9](./task_images/Screenshot_9.png)
    ![Screen10](./task_images/Screenshot_10.png)
  - Transfer of the previously created EBS disk from the first VM to the second:
  ![Screen11](./task_images/Screenshot_11.png)
  ![Screen12](./task_images/Screenshot_12.png)
  - Creating and configuring a WordPress instance using Amazon Lightsail, setting up a static IP address, DNS:
  ![Screen13](./task_images/Screenshot_13.png)
  ![Screen14](./task_images/Screenshot_14.png)
  - Creating an instance of Simple Storage Service (S3) and:
    - Uploading files to/from the bucket via the web-interface of the S3 service.
    - Create an AWS Identity and Access Management (IAM) user.
    - Installing and configuring CLI AWS.
    - Download files to/from bucket via AWS CLI:
    ![Screen15](./task_images/Screenshot_15.png)
  - Possibilities of creating own domain and domain name using the AWS-service Route53 have been explored.
  
