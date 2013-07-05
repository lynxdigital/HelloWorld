class ssh::server::config inherits ssh::common::config {

  # Copy The Server Config File
  file { '/etc/ssh/sshd_config':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Class['ssh::server::install'],
    notify  => Class['ssh::server::service'],
  }

  # Copy Banner File
  file { '/etc/ssh/banner':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/banner',
    require => File['/etc/ssh/sshd_config'],
    notify  => Class['ssh::server::service'],
  }

}