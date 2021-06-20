# Molecule Testing

This is a vagrant setup that I use for when I want to do some molecule testing.  I did this for development on my macbook, because I can't seem to get molecule to work correctly when using the docker plugin.

This setup, will set up a VM with ubuntu2004, ansible, molecule and docker.

## Requirements

* Virtualbox 

## How to Initialize

_Spin up the server_

* vagrant up <VM name>

ex. `vagrant up molecule`

**NOTE:** By default, when you spin up the server VM, it will install ansible from the 2.9.x tree.  If you want to use ansible from a different version tree, do the following:

env ANSIBLE_VERSION=_**VersionNumber**_ vagrant up server

`env ANSIBLE_VERSION=2.10.10 vagrant up molecule`


## How to use

`/vagrant` is a shared folder, mapped from the host to the guest.  The source of `/vagrant` is the current working directory when the server was initialized.  

A basic ansible project structure is already there and it follows the ansible recommended alternate layout best practices.  


**NOTE:** I currently have the following vagrant boxes hosted at vagrant cloud: jcpetro97/centos7, jcpetro97/centos8, jcpetro97/ubuntu1804, jcpetro97/ubuntu2004.