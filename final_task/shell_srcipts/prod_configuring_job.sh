echo "========== Making Ansible hosts file =========="
ans_d=../../repository/ansible/prod
echo "[prod_servers]" > ./hosts
cat $ans_d/instance_ips | while read ip
do
  echo "Ubuntu-$ip   ansible_host=$ip" >> ./hosts
done
cat << EOF >> ./hosts

[ubuntu_cred:children]
prod_servers

[all:vars]
ansible_user = ubuntu
EOF

echo "========== Making ubuntu-cred file ==========="
cat << EOF > ./ubuntu_cred
---
ansible_user = ubuntu
ansible_ssh_private_key_file = /home/ubuntu/.ssh/id_rsa
EOF

rds_endpoint=`cat $ans_d/rds_endpoint`

echo "============ Making playbook.yml ============="
cat << EOF > ./playbook.yml
---
- name: Java Runtime Environment installation, export MySQL DB address
  hosts: all
  become: yes

  tasks:
  - name: Update APT package manager repositories cache
    apt:
      update_cache: yes

  - name: Install Java using Ansible
    apt:
      name: "{{ packages }}"
      state: present
    vars:
      packages:
        - openjdk-11-jre-headless

  - name: Export environment variable for connection to DB
    shell: "echo '$MYSQL_URL'"
    environment:
      MYSQL_URL: jdbc:mysql://$rds_endpoint:3306/petclinic
EOF
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts playbook.yml
