class ssh::server::install inherits ssh::common::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # install OpenSSH Server Package
  package { 'openssh-server':
    ensure => 'latest',
  }

}