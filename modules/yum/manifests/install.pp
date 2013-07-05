class yum::install {

  # Install Main Yum Package
  package { 'yum':
    ensure => 'latest',
  }

}