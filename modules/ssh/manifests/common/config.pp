class ssh::common::config {

  # Common Configuration Elements
  file { '/etc/ssh':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

}