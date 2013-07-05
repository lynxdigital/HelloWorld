class secure::server::networking {

  # Disable IP Forwarding
  # Disable Send Packet Redirects
  # Disable Source Routed Packet Acceptance
  # Disable ICMP Redirect Acceptance
  # Log Suspicious Packets
  # Enable Ignore Broadcast Requests
  # Enable Bad Error Message Protection
  # Enable TCP SYN Cookies
  augeas { "sysctl_ipv4_config":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set net.ipv4.ip_forward 0",
      "set net.ipv4.conf.all.send_redirects 0",
      "set net.ipv4.conf.default.send_redirects 0",
      "set net.ipv4.conf.all.accept_source_route 0",
      "set net.ipv4.conf.default.accept_source_route 0",
      "set net.ipv4.conf.all.accept_redirects 0",
      "set net.ipv4.conf.default.accept_redirects 0",
      "set net.ipv4.conf.all.secure_redirects 0",
      "set net.ipv4.conf.default.secure_redirects 0",
      "set net.ipv4.conf.all.log_martians 1",
      "set net.ipv4.conf.default.log_martians 1",
      "set net.ipv4.icmp_echo_ignore_broadcasts 1",
      "set net.ipv4.icmp_ignore_bogus_error_responses 1",
      "set net.ipv4.tcp_syncookies 1",
      "set net.ipv6.conf.all.accept_ra 0",
      "set net.ipv6.conf.default.accept_ra 0",
      "set net.ipv6.conf.all.accept_redirects 0",
      "set net.ipv6.conf.default.accept_redirects 0",
      'set net.ipv4.conf.all.secure_redirects 0',
      'set net.ipv4.conf.default.secure_redirects 0',
      'set net.ipv4.conf.all.rp_filter 1',
      'set net.ipv4.conf.default.rp_filter 1',
  
    ],
  }
  
  # Disable IPv6 Router Advertisements
  # Disable IPv6 Redirect Acceptance
  augeas { "sysctl_ipv6_config":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set net.ipv6.conf.all.accept_ra 0",
      "set net.ipv6.conf.default.accept_ra 0",
      "set net.ipv6.conf.all.accept_redirects 0",
      "set net.ipv6.conf.default.accept_redirects 0",
    ],
  }
  
  # Create /etc/hosts.allow
  # Verify Permissions on /etc/hosts.allow
  $hosts_allow='ALL'
  file { '/etc/hosts.allow':
    ensure  => 'file',
    content => "ALL: ${hosts_allow}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Create /etc/hosts.deny
  # Verify Permissions on /etc/hosts.deny
  $hosts_deny='ALL'
  file { '/etc/hosts.deny':
    ensure  => 'file',
    content => "ALL: ${hosts_deny}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Disable DCCP, SCTP, RDS, TIPC Protocols
  $protocol_blacklist = [ 'dccp', 'sctp', 'rds', 'tipc' ]
  secure::blacklist::module { $protocol_blacklist: }

}