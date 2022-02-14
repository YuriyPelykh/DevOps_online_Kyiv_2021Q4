echo "========== Deploy artifact to production ==========="

ans_d=../../repository/ansible/prod

artifact_name=`ls target/`

cat $ans_d/instance_ips | while read ip
do
  scp -v -o StrictHostKeyChecking=no target/$artifact_name ubuntu@$ip:/home/ubuntu/
  ssh -o StrictHostKeyChecking=no ubuntu@$ip "killall java; export MYSQL_URL=jdbc:mysql://`cat $ans_d/rds_endpoint`:3306/petclinic; nohup java -jar $artifact_name > /dev/null 2>&1 &"
done

echo "========== Deploy artifact to production finish ==========="
