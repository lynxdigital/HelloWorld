class ssh::client::install inherits ssh::common::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install OpenSSH Clients
  package { 'openssh-clients':
    ensure => 'latest',
  }

}