class apache::service {

  # Apache HTTPD Service Control
  service { 'httpd':
    ensure      => 'running',
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['apache::config']
  }

}