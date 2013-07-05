class yum::repo::updates {

  # Include Base Repository And Key
  require yum::key::centos
  require yum::repo::base

  # Load CentOS Updates Repository
  yum::repo::config { 'CentOS-Updates':
    longName    => 'CentOS Updates',
    mirrorList  => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates',
    enabled     => '1',
    gpgKey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
    gpgCheck    => '1',
    require     => Class['yum::key::centos'],
  }

}



