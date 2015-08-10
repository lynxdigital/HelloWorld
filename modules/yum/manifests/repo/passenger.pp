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
    baseUrl  => 'https://oss-binaries.phusionpassenger.com/yum/passenger/el/$releasever/$basearch',
    enabled  => '1',
    gpgKey   => 'https://packagecloud.io/gpg.key',
    gpgCheck => '0',
  }

}
