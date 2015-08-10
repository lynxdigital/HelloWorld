
#!/bin/bash
# HelloWorld Deployment Bootstrap
# Geoffrey Harrison

# Check If This Is The Vagrant Machine
if [ "${HOSTNAME}" == "helloworld.local" ]
then 
  cd /vagrant
fi

# Disable SELinux For Passenger Load
sed -i 's/^SELINUX=.*$/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*$/SELINUX=disabled/g' /etc/selinux/config

# Copy Files To Temp - Prepare Phase 2
cp -a /vagrant /tmp/
echo "/tmp/vagrant/phase2.sh" >> /etc/rc.local

# Update The OS Before Restart
echo " ----- Updating OS..."
yum -y update
reboot

