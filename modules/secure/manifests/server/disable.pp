class secure::server::disable {

  # Remove Any Insecure Services
  $packages=['telnet-server', 'telnet', 'rsh-server', 'rsh', 'ypbind', 'ypserv', 'tftp', 'tftp-server', 'talk', 'talk-server', 'xinetd']
  package { $packages:
    ensure => 'absent',
  }

  # Disable Any Insecure xinetd services
  $services=['chargen-dgram', 'chargen-stream', 'daytime-dgram', 'daytime-stream', 'echo-dgram', 'echo-stream', 'tcpmux-server']
  service { $services:
    ensure     => 'stopped',
    enable     => false,
  }

}