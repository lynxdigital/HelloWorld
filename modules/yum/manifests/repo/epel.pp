class yum::repo::epel {

  # Ensure OS Is Available
  require yum::repo::updates

  # Install Protection And Lookup Plugins For Yum
  require yum::plugin::protectBase
  require yum::plugin::fastestMirror

  # Load EPEL Third Party Repository
  yum::repo::config { 'epel':
    longName       => 'Extra Packages for Enterprise Linux 6 - $basearch',
    mirrorList     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    failoverMethod => 'priority',
    enabled        => '1',
    gpgCheck       => '0',
  }

}