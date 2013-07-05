class timezone::sydney::config {

  # Link Localtime To Sydney TZData
  file { '/etc/localtime':
    ensure  => 'link',
    target  => '/usr/share/zoneinfo/Australia/Sydney',
    require => Class['timezone::install'],
  }

}