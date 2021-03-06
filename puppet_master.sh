#!/bin/bash

#Install puppet server package
yum install -y puppetserver

PENVS="production test"

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

setenforce 0

mv /vagrant/puppets.conf.master /etc/puppet/puppet.conf
mv /vagrant/hosts.master /etc/hosts

systemctl enable puppetserver
systemctl restart puppetserver

