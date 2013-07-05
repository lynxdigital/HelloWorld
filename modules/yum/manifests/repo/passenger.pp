class yum::repo::passenger {

  # Include Base and Updates
  require yum::repo::updates
  require yum::repo::epel

  # Install Protection And Lookup Plugins For Yum
  require yum::plugin::protectBase
  require yum::plugin::fastestMirror

  # Load Passenger Repository
  yum::repo::config { 'passenger':
    longName => 'Passenger Repository',
    baseUrl  => 'http://passenger.stealthymonkeys.com/rhel/6/x86_64/',
    enabled  => '1',
    gpgKey   => 'http://passenger.stealthymonkeys.com/RPM-GPG-KEY-stealthymonkeys.asc',
    gpgCheck => '1',
  }

}