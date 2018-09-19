# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box = "Ubuntu-14.04-Server-amd64"

  #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provider "docker" do |d|
    d.image = "ubuntu:trusty"
    d.cmd = ["tail", "-f", "/dev/null"] ## trick to keep it running
  end

  # Forward SSH X11 connections, useful for testing the ROOT GUI works
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provision "shell", path: "provisioning.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end
end
