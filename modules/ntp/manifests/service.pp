class ntp::service {

  # Configure The NTP Service
  service { 'ntpd':
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['ntp::config'],
  }

}