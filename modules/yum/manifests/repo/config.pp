define yum::repo::config (
  $shortName = undef,
  $longName = undef,
  $baseUrl = undef,
  $mirrorList = undef,
  $failoverMethod = undef,
  $enabled = '0',
  $gpgCheck = '0',
  $gpgKey = undef,
) {

  # Require Yum Patameters
  require yum::params

  # Install And Configure The Yum Program If Required
  include yum::install
  include yum::config

  # Define Some Variables
  if $shortName == undef { $lcl_shortName = $name }

  # Write Config File For Repository
  file { "/etc/yum.repos.d/${lcl_shortName}.repo":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('yum/yum.repo.erb'),
    require => [Class['yum::install'],Class['yum::config']],
  }

}