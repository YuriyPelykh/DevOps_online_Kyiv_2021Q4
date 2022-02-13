echo "========== Making Ansible hosts file =========="
ans_d=../../repository/ansible/dev
echo "[dev_servers]" > ./hosts
cat $ans_d/instance_ips | while read ip
do
  echo "Ubuntu-$ip   ansible_host=$ip" >> ./hosts
done
cat << EOF >> ./hosts

[ubuntu_cred:children]
dev_servers

[all:vars]
ansible_user = ubuntu
EOF


echo "========== Making ubuntu-cred file ==========="
cat << EOF > ./ubuntu_cred
---
ansible_user = ubuntu
ansible_ssh_private_key_file = /home/ubuntu/.ssh/id_rsa
EOF

echo "============ Making playbook.yml ============="
cat << EOF > ./playbook.yml
---
- name: Docker installation
  hosts: all
  become: yes

  tasks:
  - name: Docker dependencies installation
    apt: name={{ item }} state=latest update_cache=yes
    loop: [ 'ca-certificates', 'curl', 'gnupg', 'lsb-release' ]

  - name: Add Docker GPG apt Key
    apt_key:
      url: https://download.docker.com/linux/ubuntu/gpg
      state: present

  - name: Add Docker Repository
    apt_repository:
      repo: deb https://download.docker.com/linux/ubuntu bionic stable
      state: present

  - name: Install Docker
    apt: name={{ item }} state=latest update_cache=yes
    loop: [ 'docker-ce', 'docker-ce-cli', 'containerd.io' ]

  - name: Checking Docker was started and enabled
    service: name=docker state=started enabled=yes

  - name: Add "ubuntu" user to "docker" group
    remote_user: ubuntu
    user:
      name: "ubuntu"
      groups: "docker"
      append: yes

  - name: Install docker-compose from official github repo
    remote_user: ubuntu
    get_url:
      url : https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64
      dest: /usr/local/bin/docker-compose
      mode: 'a+x'

  handlers:
  - name: Restart Docker
    service: name=docker state=restarted

EOF
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts playbook.yml
