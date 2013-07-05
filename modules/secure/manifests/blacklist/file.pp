class secure::blacklist::file {

  # Start Building Module Blacklist File
  concat { '/etc/modprobe.d/custom.conf':
    owner => 'root',
    group => 'root',
    mode  => '0600',
  }

  # Add A Message About Puppet Control
  concat::fragment { 'puppet_conf_msg':
    target  => '/etc/modprobe.d/custom.conf',
    content => "# Security Blacklist - Under Puppet Control\n\n",
    order   => 01,
  }

}