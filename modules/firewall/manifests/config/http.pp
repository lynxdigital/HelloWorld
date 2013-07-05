class firewall::config::http {

  # Open A Firewall Port To Allow Connections To HTTP Port
  firewall { '100 allow http':
    state   => ['NEW'],
    dport   => '80',
    proto   => 'tcp',
    action  => 'accept',
    require => Class['firewall::config::default::pre'],
    before  => Class['firewall::config::default::post'],
    notify  => Exec['persist-firewall'],
  }

}
