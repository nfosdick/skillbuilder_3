#!/bin/bash -x
mkdir -p /etc/puppetlabs/facter/facts.d
echo "role=puppetmaster" > /etc/puppetlabs/facter/facts.d/role.txt
mkdir -p /etc/puppetlabs/puppetserver/ssh/
cp /vagrant/id_rsa /etc/puppetlabs/puppetserver/ssh/
chmod -R 700 /etc/puppetlabs/puppetserver/ssh
cd /tmp/puppet-enterprise-2017.2.3-el-7-x86_64;./puppet-enterprise-installer -c /tmp/puppet-enterprise-2017.2.3-el-7-x86_64/conf.d/pe.conf
chown -R pe-puppet:pe-puppet /etc/puppetlabs/puppetserver/ssh
puppet config print data_binding_terminus
puppet agent -t 
