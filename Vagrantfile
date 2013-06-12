# -*- mode: ruby; -*-
require 'etc'

Vagrant.configure("2") do |config|
  config.vm.define :web do |web|
    web.vm.box = "precise64"
    web.vm.box_url = "http://files.vagrantup.com/precise64.box"
    web.vm.hostname = "vagrant.django-salted.org"
    web.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true

    web.vm.provision :salt do |salt|

      # Configure the minion
      salt.minion_config = "minion.conf"

      # Pre-distribute these keys on our local installation
      salt.minion_key = "keys/vagrant.django-salted.org.pem"
      salt.minion_pub = "keys/vagrant.django-salted.org.pub"

      # Run the highstate on start
      salt.run_highstate = true

      # Install the latest version of SaltStack
      salt.install_type = "daily"
    end

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
    end
  end
end
