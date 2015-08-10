define sudo::user::config (
  $user = undef,
  $type = 'nopasswd',
) {

  # Require Sudo Install And Config
  require sudo::install
  #require sudo::config

  if $user == undef { $lclUser = $name } else { $lclUser = $user }

  # Load User Template File
  file { "/etc/sudoers.d/${lclUser}":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template("sudo/${type}"),
  }

}
