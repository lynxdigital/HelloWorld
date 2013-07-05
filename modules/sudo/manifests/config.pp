class sudo::config {

  # Load Sudoers Configuration File
  file { '/etc/sudoers':
    ensure  => 'file',
    source  => 'puppet:///modules/sudo/sudoers',
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    require => [ Class ['sudo::install'], File ['/etc/sudoers.d' ] ],
  }

  file { '/etc/sudoers.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    recurse => true,
    purge   => true,
    force   => true,
    require => Class['sudo::install'],
  }

}