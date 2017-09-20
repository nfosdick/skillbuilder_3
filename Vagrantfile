# -*- mode: ruby -*-
# vi: set ft=ruby :

box      = 'puppetlabs/centos-7.2-64-puppet'
ram      = '3072'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = box
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
  config.vm.hostname = 'puppet.lark.com'

  config.vm.provider "virtualbox" do |vb|
  #  vb.name = "puppetmaster"
    vb.memory = '3072'
  end

  config.vm.provision "shell", inline: 'yum -y install git'
  config.vm.provision "shell", inline: '/bin/systemctl stop firewalld.service'
  config.vm.provision "shell", inline: 'cp /vagrant/puppet-enterprise-2017.2.3-el-7-x86_64.tar.gz /tmp/'
#  config.vm.provision "shell", inline: 'wget -O - https://downloads.puppetlabs.com/puppet-gpg-signing-key.pub | gpg --import'
#  config.vm.provision "shell", inline: 'gpg --fingerprint 0x7F438280EF8D349F|grep "6F6B 1550 9CF8 E59E 6E46  9F32 7F43 8280 EF8D 349F"'
#  config.vm.provision "shell", inline: 'gpg --verify /vagrant/puppet-enterprise-2017.2.3-el-7-x86_64.tar.gz.asc|grep "6F6B 1550 9CF8 E59E 6E46  9F32 7F43 8280 EF8D 349F"'
  config.vm.provision "shell", inline: 'gunzip /tmp/puppet-enterprise-2017.2.3-el-7-x86_64.tar.gz'
  config.vm.provision "shell", inline: 'cd /tmp;tar -xvf /tmp/puppet-enterprise-2017.2.3-el-7-x86_64.tar'
  config.vm.provision "shell", inline: 'cp /vagrant/pe.conf /tmp/puppet-enterprise-2017.2.3-el-7-x86_64/conf.d/pe.conf'
#  config.vm.provision "shell", inline: 'cd /tmp/puppet-enterprise-2017.2.3-el-7-x86_64;./puppet-enterprise-installer -c /tmp/puppet-enterprise-2017.2.3-el-7-x86_64/conf.d/pe.conf'
  config.vm.provision "shell", inline: 'cp /vagrant/install_puppet.sh /tmp/;chmod 700 /tmp/install_puppet.sh'
  config.vm.provision "shell", inline: '/tmp/install_puppet.sh'
#  config.vm.provision "shell", inline: 'puppet-access login --service-url https://puppet.lark.com:4433/rbac-api --lifetime 180d'
end
