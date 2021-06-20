#!/bin/bash
ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.9.22}

# Install Python.
/bin/echo "------> installing python3 <------"
/usr/bin/apt update
/usr/bin/apt -y install python3 python3-pip sshpass
/bin/echo "------> upgrade pip <------"
/usr/bin/python3 -m pip install --upgrade pip
/bin/echo "------> upgrade setuptools <------"
/usr/bin/python3 -m pip install --upgrade setuptools
# install docker
/bin/echo "------> installing docker <------"
/usr/bin/apt -y install apt-transport-https ca-certificates curl gnupg lsb-release
apt-get -y remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
apt update
apt -y install docker-ce docker-ce-cli containerd.io
# add the vagrant user to the docker group
usermod -a -G docker vagrant

# # Install Ansible.
if [[ $ANSIBLE_VERSION =~ "2.9" ]]
then
    /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible==$ANSIBLE_VERSION

else    
    /bin/echo "------> Install Ansible $ANSIBLE_VERSION <------"
    /usr/bin/python3 -m pip install ansible-base==$ANSIBLE_VERSION

fi
#
/bin/echo "------> Verify Ansible Version <------"
/usr/local/bin/ansible --version

/bin/echo "------> installing yamllint <------"
/usr/bin/python3 -m pip install yamllint
/bin/echo "------> installing molecule and the docker plugin <------"
/usr/bin/python3 -m pip install molecule
/usr/bin/python3 -m pip install molecule[docker]
/usr/bin/python3 -m pip install docker