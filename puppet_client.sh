#!/bin/bash

#Install the puppet agent package
yum install -y puppet

mv /vagrant/hosts.client /etc/hosts
mv /vagrant/puppets.conf.client /etc/puppet/puppet.conf

puppet agent --verbose --no-daemonize --onetime