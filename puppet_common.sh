#!/bin/bash

#Install puppet labs initial rpm to set things up if not installed already

rpm -q puppetlabs-release > /dev/null 2>&1

if [ $? -ne 0 ]
then
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
fi

PENVS="production"

for NEWENV in ${PENVS}
do
    MODULEDIR="/etc/puppet/environments/${NEWENV}/modules"
    MANIFESTDIR="/etc/puppet/environments/${NEWENV}/manifests"
    ENVCONF="/etc/puppet/environments/${NEWENV}/environment.conf"

    [ ! -d ${MODULEDIR} ] && mkdir -p ${MODULEDIR}
    [ ! -d ${MANIFESTDIR} ] && mkdir -p ${MANIFESTDIR}

    echo "modulepath=${MODULEDIR}" > ${ENVCONF}
    echo "environment_timeout=5s" >> ${ENVCONF}
done

mv /vagrant/puppets.conf /etc/puppet/puppet.conf
