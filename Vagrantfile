# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "geerlingguy/ubuntu2004"
    config.vm.box_version = "1.0.2"
    config.ssh.insert_key = false
    config.vm.hostname = "iacdemo"
    config.vm.network "private_network", ip: "10.10.10.10"

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
        v.linked_clone = true
        v.auto_nat_dns_proxy = false
        v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end

    config.vm.provision "shell", inline: "echo 'cd /vagrant' >> /home/vagrant/.bashrc"
    config.vm.provision "shell", inline: "chmod +x /vagrant/install-tools.sh"
    config.vm.provision "shell", privileged: false, inline: "bash /vagrant/install-tools.sh"
end