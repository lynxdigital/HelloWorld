class apache::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install httpd package
  package { 'httpd':
    ensure => 'present',
  }

}
