# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false
 # config.vbguest.auto_update = true
  config.vm.define :molecule do |x|
    x.vm.box = "jcpetro97/ubuntu2004"
    x.vm.synced_folder '.', '/vagrant', disabled: false
    x.vm.hostname = "molecule"
#    x.vm.network "private_network", ip: "192.168.70.2"
    x.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
      vb.gui = false
      vb.name = "ubuntu2004-Molecule"
    end
#    x.vm.provision "shell" do |s|
#      s.path = "./shared/ubuntu.sh"
#      s.env   = {ANSIBLE_VERSION:ENV['ANSIBLE_VERSION']}
#    end
  end
end
