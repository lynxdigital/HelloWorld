class apache::config {

  # Copy Apache Config
  file { '/etc/httpd/conf/httpd.conf':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source  => 'puppet:///modules/apache/httpd.conf',
    require => Class['apache::install'],
  }

  # Copy Apache Default Site Config
  file { '/etc/httpd/conf.d/000-default.conf':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0644',
    source  => 'puppet:///modules/apache/000-default.conf',
    require => File['/etc/httpd/conf/httpd.conf'],
  }

}
