class git::install {

  # Include Base And Updates
  require yum::repo::base
  require yum::repo::updates

  # Install Git Package
  package { 'git':
    ensure => installed,
  }

}