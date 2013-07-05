class yum::key::centos {

  # Load CentOS 6 OS Key For YUM
  yum::key::config { 'CentOS-6-Key':
    key => 'RPM-GPG-KEY-CentOS-6'
  }

}