#!/bin/bash

#Install puppet labs initial rpm to set things up if not installed already

rpm -q puppetlabs-release > /dev/null 2>&1

if [ $? -ne 0 ]
then
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
fi