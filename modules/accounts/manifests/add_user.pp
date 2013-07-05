define accounts::add_user (
  $comment,
  $uid,
  $pri_group,
  $groups     ='',
  $password   ='',
  $ensure     ='present',
) {

  # Define Some Local Variable
  $username = $name
  $lgroups = $groups ? {
          ''      => undef,
          default => $groups
          }
  $lpassword = $password ? {
          ''      => undef,
          default => $password
          }

  # Configure The System User
  user { $username:
    ensure   => $ensure,
    comment  => $comment,
    home     => "/home/${username}",
    shell    => '/bin/bash',
    uid      => $uid,
    gid      => $pri_group,
    groups   => $lgroups,
    password => $lpassword,
    require  => Group[$pri_group],
  }

  # Check Home Directory
  file { "/home/${username}/":
    ensure  => 'directory',
    owner   => $username,
    group   => $pri_group,
    mode    => '0750',
    require => [User[$username], Group[$pri_group]]
  }

  # Copy BashRC File
  file { "/home/${username}/.bashrc":
    ensure  => 'present',
    source  => 'puppet:///modules/accounts/bashrc.sh',
    owner   => $username,
    group   => $pri_group,
    mode    => '0750',
    require => File["/home/${username}/"],
  }

  # Copy Bash Profile
  file { "/home/${username}/.bash_profile":
    ensure  => 'present',
    source  => 'puppet:///modules/accounts/bash_profile.sh',
    owner   => $username,
    group   => $pri_group,
    mode    => '0750',
    require => File["/home/${username}/"],
  }

  # Copy Bash Logout
  file { "/home/${username}/.bash_logout":
    ensure  => 'present',
    source  => 'puppet:///modules/accounts/bash_logout.sh',
    owner   => $username,
    group   => $pri_group,
    mode    => '0750',
    require => File["/home/${username}/"],
  }

  # Check Home .ssh Directory
  file { "/home/${username}/.ssh":
    ensure  => 'directory',
    owner   => $username,
    group   => $pri_group,
    mode    => '0700',
    require => File["/home/${username}/"],
  }

  # Create Authorized Keys File For User
  file { "/home/${username}/.ssh/authorized_keys":
    ensure  => 'file',
    owner   => $username,
    group   => $pri_group,
    mode    => '0600',
    require => File["/home/${username}/.ssh"]
  }

}