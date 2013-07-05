#!/bin/bash
# Puppet Installation Script
# Installs Puppet Onto CentOS 6.4 Minimum Installation Using
# Internet Based Repositories

# Load Any Proxies
. ./proxy.sh

# Set SELinux To Permissive
sed -i 's/=enforcing/=permissive/g' /etc/sysconfig/selinux
setenforce 0

# Install Yum Sources
rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Puppet
yum -y install puppet

# Remove Yum Sources - These Will Be Managed By Puppet
rpm -e puppetlabs-release-6-7 epel-release-6-8
