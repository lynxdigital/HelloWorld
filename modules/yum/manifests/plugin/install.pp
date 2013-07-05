define yum::plugin::install (
  $plugin = undef,
) {

  if $plugin == undef { $plugin = $name }

  # Install Yum Plugin Packages
  package { "yum-plugin-${plugin}":
    ensure   => 'latest',
    require  => Class['yum::install'],
  }

}