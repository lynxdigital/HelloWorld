class yum::config {

  # Load Default Yum Paramaters
  require yum::params

  # Write Main Configuration File For YUM
  file { '/etc/yum.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('yum/yum.conf.erb'),
    require => Class['yum::install'],
  }

  # Manage YUM Repository Directory
  file { '/etc/yum.repos.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
    force   => true,
    require => Class['yum::install'],
  }

}
