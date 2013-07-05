class firewall::config::ssh {

  # Open A Firewall Port To Allow Connections To SSH Port
  firewall { '100 allow ssh':
    state   => ['NEW'],
    dport   => '22',
    proto   => 'tcp',
    action  => 'accept',
    require => Class['firewall::config::default::pre'],
    before  => Class['firewall::config::default::post'],
    notify  => Exec['persist-firewall'],
  }

}