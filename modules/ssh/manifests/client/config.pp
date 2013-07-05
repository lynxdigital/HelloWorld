class ssh::client::config inherits ssh::common::config {

  # Copy The Client Config File
  file { '/etc/ssh/ssh_config':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    source  => 'puppet:///modules/ssh/ssh_config',
    require => Class['ssh::client::install'],
  }

}