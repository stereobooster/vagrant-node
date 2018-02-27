VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = true

  # Ports for http, https, Express, http-server and Harp
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 9000, host: 9000, host_ip: "127.0.0.1"

  config.ssh.forward_agent = true

  config.vm.synced_folder "projects", "/home/vagrant/projects"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision "docker" do |docker|
    docker.pull_images "ubuntu"
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false
end
