class firewall::service {

  # Ensure The Firewall Service Is Running
  service { 'iptables':
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['firewall::config::default'],
  }

}