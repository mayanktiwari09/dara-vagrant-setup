# -*- mode: ruby -*-
# vi: set ft=ruby :

VM_NAME = "DaraVM"
VM_MEMORY = "8192"  # MB

Vagrant.configure(2) do |config|
  # The online documentation for the configuration options is located at
  # https://docs.vagrantup.com

  # Our box
  config.vm.box = "ubuntu/xenial64"
  config.disksize.size = '50GB'

  # Customize the amount of memory on the VM:
  config.vm.provider "virtualbox" do |vb|
     vb.name = VM_NAME
     vb.memory = VM_MEMORY
  end

  # SSH
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.ssh.keep_alive = true

  # Forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. Accessing
  # "localhost:8000" will access port 8000 on the guest machine.
  config.vm.network :forwarded_port, guest: 8000, host: 8000

end
