class yum::repo::base {

  # Load CentOS Key
  require yum::key::centos

  # Load CentOS Base Repository
  yum::repo::config { 'CentOS-Base':
    longName => 'CentOS Base',
    mirrorList => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os',
    enabled  => '1',
    gpgKey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
    gpgCheck => '1',
    require => Class['yum::key::centos'],
  }

}


