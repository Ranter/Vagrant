# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # JSI-VM FTW!
  config.vm.define "jsi-vm"

  # Box settings
  # config.vm.box     = "saucy-server-amd64-current" # 13.10
  # config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box     = "precise-server-amd64-current" # 12.04 LTS
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # Network / SSH settings
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true

  # Disable sycned folders
  config.vm.synced_folder ".", "/vagrant", :disabled => true

  # Customize the VM
  config.vm.provider "virtualbox" do |vb|
    vb.name = "jsi-vm"

    vb.customize [
      "modifyvm", :id,
      "--name", "jsi-vm",
      "--ostype", "Ubuntu_64",
      "--cpus", 2,
      "--memory", "1024",
      "--ioapic", "on",
      "--usb", "off",
      "--audio", "none"
    ]
  end

  # Provision
  config.vm.provision :shell, :path => "shell/provision.sh"
  config.vm.provision :shell, :path => "shell/install-rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "shell/install-ruby.sh", :args => "2.1.1 bundler"
  config.vm.provision :shell, :path => "shell/create-swap-file.sh"
end
