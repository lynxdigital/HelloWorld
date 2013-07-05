class firewall::config::default {
  $ipv4_file = '/etc/sysconfig/iptables'

  # Purge Any Rules Not Controlled By Puppet
  resources { 'firewall':
    purge => true,
  }

  # Call Classes
  include firewall::config::default::pre, firewall::config::default::post

  # Make The Firewall Persistent Across Reboots
  exec { 'persist-firewall':
    command     => "/bin/echo \"# This File Is Managed By Puppet. Do Not Modify Manually!\" > $ipv4_file && /sbin/iptables-save >> $ipv4_file",
    refreshonly => true,
    user        => 'root',
    require     => [Package['iptables'],Class['firewall::config::default::post']],
  }

}