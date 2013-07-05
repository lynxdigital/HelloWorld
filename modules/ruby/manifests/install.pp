class ruby::install {

  # Include EPEL Repository
  include yum::repo::epel

  # Install Ruby
  package { 'ruby':
    ensure => 'present',
  }

  # Install Rubygems
  package { 'rubygems':
    ensure => 'present',
  }

}