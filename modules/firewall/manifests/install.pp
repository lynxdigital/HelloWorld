class firewall::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Define Firewall Packages
  $packages=['iptables', 'iptables-ipv6']

  # Install Packages
  package { $packages:
    ensure => 'present',
  }

}