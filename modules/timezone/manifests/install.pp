class timezone::install {

  # Require Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install TZData Package
  package { "tzdata":
    ensure => 'present',
  }

}