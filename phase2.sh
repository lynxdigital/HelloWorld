#!/bin/bash
# HelloWorld Deployment Bootstrap
# Geoffrey Harrison

# Check If This Is The Vagrant Machine
if [ "${HOSTNAME}" == "helloworld.local" ]
then 
  cd /tmp/vagrant
  sed -i "s/\/tmp\/vagrant\/phase2\.sh//g" /etc/rc.local
fi

# Load Any Proxy Settings
if [ -f ./proxy.sh ]
then
  . proxy.sh
fi

# Update OS
echo " ----- Updating OS..."
yum -y update

# Check If Puppet Has Been Installed
rpm -qa | grep -q ^puppet ; grepResult=$?
if [ $grepResult -ne 0 ]
then
  # Install Yum Sources And Puppet Executor
  echo " ----- Installing Puppet..."
  sudo yum -y install epel-release && \
  sudo yum -y install puppet
fi

# Execute Puppet Deployment
echo " ----- Running Puppet..."
echo include ruby::app::helloWorld | puppet apply --modulepath ./modules/ -v -d

# Completed
echo " ----- Bootstrap Completed."
exit 0

