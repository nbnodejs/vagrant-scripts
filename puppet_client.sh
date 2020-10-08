#!/bin/bash

#Install the puppet agent package
yum install -y puppet

mv /vagrant/hosts.client /etc/hosts