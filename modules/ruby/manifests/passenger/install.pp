class ruby::passenger::install {

  # Passenger Needs Apache And Ruby
  require apache
  require ruby::install

  # Include Yum Repositories
  require yum::repo::passenger

  # Install Passenger
  package { 'mod_passenger':
    ensure  => 'present',
    require => Class['apache'],
    notify  => Service['httpd'],
  }

}