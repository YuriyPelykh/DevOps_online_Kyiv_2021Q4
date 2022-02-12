echo "========== Delivery to Dev with Docker Start ==========="

ans_d=../../repository/ansible/dev
artif_name=`ls target/`
echo $artif_name

cat << EOF > Dockerfile
FROM openjdk
COPY ./*.jar /deployments/$artif_name
CMD java -jar /deployments/$artif_name
EXPOSE 8000
EOF

cat << EOF > docker-compose.yml
version: '3.3'
services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=
      - MYSQL_ALLOW_EMPTY_PASSWORD=true
      - MYSQL_USER=petclinic
      - MYSQL_PASSWORD=petclinic
      - MYSQL_DATABASE=petclinic
  app:
    depends_on:
      - db
    image: spring-petclinic:$BUILD_NUMBER
    ports:
      - "8000:8000"
    restart: always
volumes:
  db_data:
EOF

cat $ans_d/instance_ips | while read ip
do
  scp -v -o StrictHostKeyChecking=no target/*.jar Dockerfile docker-compose.yml ubuntu@$ip:/home/ubuntu/
  ssh -v -o StrictHostKeyChecking=no ubuntu@$ip "docker build -t spring-petclinic:$BUILD_NUMBER . && docker-compose up -d --force-recreate"

done

echo "========== Delivery to Dev with Docker Finish ==========="
