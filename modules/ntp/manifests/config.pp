class ntp::config {

  # Update Security On NTP Folder
  file { '/etc/ntp':
    ensure  => 'directory',
    mode    => '0750',
    owner   => 'root',
    group   => 'ntp',
    require => Class['ntp::install'],
  }

  # Update Security On Crypto Folder
  file { '/etc/ntp/crypto':
    ensure  => 'directory',
    mode    => '0750',
    owner   => 'root',
    group   => 'ntp',
    require => Class['ntp::install'],
  }

  # Create/Update Security On Var Lib Folder
  file { '/var/lib/ntp':
    ensure  => 'directory',
    mode    => '0750',
    owner   => 'ntp',
    group   => 'ntp',
    require => Class['ntp::install'],
  }

  # Copy Out NTP keys File
  file { '/etc/ntp/keys':
    ensure  => 'present',
    source  => 'puppet:///modules/ntp/keys',
    owner   => 'root',
    group   => 'ntp',
    mode    => '0640',
    require => File['/etc/ntp'],
    notify  => Class['ntp::service'],
  }

  # Copy Out NTP keys File
  file { '/etc/ntp/step-tickers':
    ensure  => 'present',
    source  => 'puppet:///modules/ntp/step-tickers',
    owner   => 'root',
    group   => 'ntp',
    mode    => '0640',
    require => File['/etc/ntp'],
    notify  => Class['ntp::service'],
  }

  # Copy Out NTP pw File
  file { '/etc/ntp/crypto/pw':
    ensure  => 'present',
    source  => 'puppet:///modules/ntp/pw',
    owner   => 'root',
    group   => 'ntp',
    mode    => '0640',
    require => File['/etc/ntp/crypto'],
    notify  => Class['ntp::service'],
  }

  # Build The Configuration File For NTP
  file { '/etc/ntp.conf':
    ensure  => 'present',
    mode    => '0640',
    owner   => 'root',
    group   => 'ntp',
    content => template('ntp/ntp.conf.erb'),
    require => [Class['ntp::install'],File['/etc/ntp']],
    notify  => Class['ntp::service'],
  }

}