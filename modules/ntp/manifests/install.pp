class ntp::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install The NTP Server/Client Package
  package { 'ntp':
    ensure => 'latest',
  }

}