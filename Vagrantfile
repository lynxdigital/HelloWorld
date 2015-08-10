# -*- mode: ruby -*-
# vi: set ft=ruby :

# VagrantFile To Build Sinatra HelloWord Application
# Geoffrey Harrison

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Define Master Machine
  config.vm.define "helloworld" do |master|
    master.vm.box = "helloworld"
    master.vm.hostname = "helloworld.local"
    master.vm.box = "chef/centos-6.5"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    master.vm.network "forwarded_port", guest: 80, host:8080
    master.vm.network "private_network", ip: "192.168.58.10"
    master.vm.provision :shell, path: "bootstrap.sh"
  end

end
