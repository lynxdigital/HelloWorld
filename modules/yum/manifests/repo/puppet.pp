class yum::repo::puppet {

  # Ensure OS Updates Are Available
  require yum::repo::updates
  require yum::repo::epel

  # Install Protection And Lookup Plugins For Yum
  include yum::plugin::protectBase
  include yum::plugin::fastestMirror

  # Load Puppet Products Repository
  yum::repo::config { 'puppet-products':
    longName  => 'Puppet Products Repository',
    baseUrl   => 'http://yum.puppetlabs.com/el/6/products/x86_64/',
    enabled   => '1',
    gpgKey    => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    gpgCheck  => '1',
  }

  # Load Puppet Dependencies Repository
  yum::repo::config { 'puppet-deps':
    longName  => 'Puppet Dependencies',
    baseUrl   => 'http://yum.puppetlabs.com/el/6/dependencies/x86_64/',
    enabled   => '1',
    gpgKey    => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    gpgCheck  => '1',
  }

}