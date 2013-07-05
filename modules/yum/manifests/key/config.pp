define yum::key::config (
  $key = undef,
) {

  if $key == undef { $lclKey = $name } else { $lclKey = $key }

  # Copy Repository Key
  file { "/etc/pki/rpm-gpg/${lclKey}":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/yum/${lclKey}"
  }

}