# Task 11.1 Docker

## 1. Docker practice basics:  
1. Installation made as described in https://docs.docker.com/engine/install/ubuntu/  
![Screen1](./task_images/Screenshot_1.png)  
2. Allowing non privileged users to run Docker commands withput sudo:  
**sudo usermod -aG docker ubuntu**
3. Creation of **Dockerfile**:  
![Screen2](./task_images/Screenshot_2.png)  
4. Docker build image:  
![Screen3](./task_images/Screenshot_3.png)  
![Screen4](./task_images/Screenshot_4.png)  
5. Run container:   
![Screen6](./task_images/Screenshot_6.png)  
5. Checking result:  
![Screen7](./task_images/Screenshot_7.png)  

## 2. Webapps with Docker, Docker Hub:  
1. Application for random cats pictures generation:  
![Screen8](./task_images/Screenshot_8.png)  
![Screen9](./task_images/Screenshot_9.png)  
![Screen10](./task_images/Screenshot_10.png)  
![Screen11](./task_images/Screenshot_11.png)  
2. Docker build:  
![Screen12](./task_images/Screenshot_12.png)  
3. Docker run:  
![Screen13](./task_images/Screenshot_13.png)  
4. Result:  
![Screen14](./task_images/Screenshot_14.png)  
5. Push of created image to Docker Hub:  
![Screen15](./task_images/Screenshot_15.png)  
![Screen16](./task_images/Screenshot_16.png)  
![Screen17](./task_images/Screenshot_17.png)  

## 3. Docker Compose
1. Docker compose installed:  
![Screen18](./task_images/Screenshot_18.png)  
2. Craeting of **docker-compose.yml** file:  
![Screen19](./task_images/Screenshot_19.png)  
3. Containers launched:  
![Screen20](./task_images/Screenshot_20.png)  
![Screen21](./task_images/Screenshot_21.png)  
4. WP admin page is working:  
![Screen22](./task_images/Screenshot_22.png)  
5. **Note:** Syntax mistake in **docker-compose.yml** caused the WP to DB connection error, but after it was corrected, error still anyway. Solution: **docker volumes prune** also need to be performed besides **docker-compose down/up** commands (https://github.com/docker-library/mysql/issues/180#issuecomment-541244937).  



Frequently used Docker commands:
**$ docker ps [-a]**                        # list
**$ docker stop $(docker ps -a -q)**        # stop all containers [you need stop before delete]
**$ docker rm 0fd99ee0cb61**                # remove a single container
**$ docker images -a**                      # list
**$ docker rmi $(docker images -a -q)**     # remove all images

**$ docker search tomcat**
**$ docker pull tomcat**
**$ docker search nginx**
**$ docker pull nginx**
**$ docker run -it -p 8889:8080 tomcat**
**$ docker run -it -p 8888:80 nginx**
**$ docker run -d -p 8890:80 nginx**
