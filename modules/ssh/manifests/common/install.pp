class ssh::common::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install Common Packages
  package { 'openssh':
    ensure => 'latest',
  }

}