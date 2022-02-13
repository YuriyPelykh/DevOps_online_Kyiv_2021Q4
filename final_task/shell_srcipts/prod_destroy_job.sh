echo "======= Destroy of production environment AWS ========"

statefile=../../repository/terraform/prod/env_state/terraform.tfstate

if [ -e $statefile ]
  then
    cd ../../repository/terraform/prod/env_state/
    terraform destroy -auto-approve
    rm -rf ..?* .[!.]* *
    cd ../../../ansible/prod/
    rm -rf ..?* .[!.]* *
  else
    echo "============= Nothing to destroy ================="
fi
