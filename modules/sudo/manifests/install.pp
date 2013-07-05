class sudo::install {

  # Install The Sudoers Package
  package { 'sudo':
    ensure => 'present',
  }

}