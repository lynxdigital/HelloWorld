class base {

  # Base Includes For All Servers
  include firewall::default
  include ssh::client
  include ssh::server
  include timezone::melbourne
  include ntp
  include yum::repo::puppet
  include accounts::operations

  # Post Stage - Server Hardening
  include secure::server

  # Disable Some Services
    # Disable Any Insecure xinetd services
  $services=['iscsi', 'iscsid', 'postfix', 'netfs']
  service { $services:
    ensure     => 'stopped',
    enable     => false,
  }

}