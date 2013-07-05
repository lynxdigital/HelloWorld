define accounts::add_ssh_key (
  $key,
  $type='ssh-rsa',
  $ensure = 'present'
) {

  # Re-define Local Variable
  $username=$name

  # Add SSH Key To Account
  ssh_authorized_key { "${username}-${key}":
    ensure  => $ensure,
    key     => $key,
    type    => $type,
    user    => $username,
    require => File["/home/${username}/.ssh/authorized_keys"]
  }

}