class firewall::config::default::post {

  # Drop Everything Else In The INPUT Chain
  firewall { '65536 drop everything else from INPUT':
    chain   => 'INPUT',
    action  => 'drop',
    require => Class['firewall::config::default::pre'],
    notify  => Exec['persist-firewall'],
  }

  # Drop Everything Else In The FORWARD Chain
  firewall { '65536 drop everything else from FORWARD':
    chain   => 'FORWARD',
    action  => 'drop',
    require => Class['firewall::config::default::pre'],
    notify  => Exec['persist-firewall'],
  }

}