class timezone::melbourne::config {

  # Link Localtime To Melbourne TZData
  file { '/etc/localtime':
    ensure  => 'link',
    target  => '/usr/share/zoneinfo/Australia/Melbourne',
    require => Class['timezone::install'],
  }

}