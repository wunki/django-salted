# -*- mode: ruby; -*-
require 'etc'

Vagrant.configure("2") do |config|
  config.vm.define :web do |web|
    # Ubuntu 12.04
    web.vm.box = "precise64"
    web.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Network
    web.vm.hostname = "vagrant.django-salted.org"
    web.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

    # Share for masterless server
    web.vm.synced_folder "salt/roots/", "/srv/"

    web.vm.provision :salt do |salt|
      # Configure the minion
      salt.minion_config = "salt/minion.conf"

      # Show the output of salt
      salt.verbose = true
      
      # Pre-distribute these keys on our local installation
      salt.minion_key = "salt/keys/vagrant.django-salted.org.pem"
      salt.minion_pub = "salt/keys/vagrant.django-salted.org.pub"

      # Run the highstate on start
      salt.run_highstate = true

      # Install the latest version of SaltStack
      salt.install_type = "daily"
    end

    # Customize the box
    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 512]
    end
  end
end
