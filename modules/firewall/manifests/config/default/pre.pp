class firewall::config::default::pre {

  # Accept Returning System Packets
  firewall { '001 allow packets with valid state':
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
    proto  => 'all',
  }

  # Allow ICMP Packets
  firewall { '005 allow icmp':
    proto  => 'icmp',
    icmp   => '8',
    action => 'accept',
  }

  # Allow All Actions On Localhost Adapter
  firewall { '010 allow all to lo interface':
    iniface => 'lo',
    action  => 'accept',
  }

}