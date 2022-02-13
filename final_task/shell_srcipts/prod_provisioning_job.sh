echo "=========== Production AWS-infrastructure provisioning with Terraform start ============"

prod_d=../../repository/terraform/prod/env_state
ans_d=../../repository/ansible/prod

if [ ! -e  $prod_d ]
  then
    mkdir -p $prod_d
fi
if [ ! -e  $ans_d ]
  then
    mkdir -p $ans_d
fi

cp ../../repository/terraform/prod/*.tf ./

terraform init
terraform apply -auto-approve
terraform output | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > $ans_d/instance_ips
terraform output | grep rds_instance_endpoint | awk '{print $3}' | sed 's/"//g' > $ans_d/rds_endpoint

cp -rT . $prod_d/
