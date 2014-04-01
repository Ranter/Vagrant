# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Box settings
  config.vm.box     = "saucy-server-amd64-current"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"

  # Network / SSH settings
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true

  # Disable sycned folders
  config.vm.synced_folder ".", "/vagrant", :disabled => true

  # Customize the VM
  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--name", "jsi-vm",
      "--cpus", 2,
      "--memory", "2048",
      "--ioapic", "on"
    ]
  end

  # Provisioning
  config.vm.provision "shell",
    inline: "apt-get update; " <<
            "apt-get upgrade; " <<
            "export DEBIAN_FRONTEND=noninteractive; " <<
            "apt-get remove -y -q ruby1.8 ruby1.8-dev ruby1.9.1; " <<
            "apt-get install -y -q build-essential libxml2-dev libxslt1-dev libyaml-dev libsqlite3-dev sqlite3 libmysqlclient-dev libpq-dev mysql-server-5.5 ruby2.0 ruby2.0-dev git; " <<
            "apt-get autoremove -y; " <<
            "gem install bundler; " <<
            "usermod -a -G www-data vagrant; " <<
            "if test ! -d /var/jsi; then mkdir /var/jsi && chown www-data:www-data /var/jsi && chmod 775 /var/jsi; fi; "
end
