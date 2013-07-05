class secure::server::config {
  
  # Set User/Group Owner on /etc/grub.conf
  # Set Permissions on /etc/grub.conf
  file { '/boot/grub/grub.conf':
    owner =>'root',
    group => 'root',
    mode => '0600',
  }

  # Require Authentication for Single-User Mode
  # Disable Interactive Boot
  augeas { "selinux_init_config":
    context => "/files/etc/sysconfig/init",
    changes => [
      "set SINGLE /sbin/sulogin",
      "set PROMPT no",
    ],
  }

  # Restrict Core Dumps
  augeas { "limits_hard_config":
    context => "/files/etc/security/limits.conf",
    changes => [
      "set domain[last()] *",
      "set domain[last()]/type hard",
      "set domain[last()]/item core",
      "set domain[last()]/value 0",
    ],
  }
  augeas { "sysctl_suid_config":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set fs.suid_dumpable 0",
    ],
  }
  
  # Configure ExecShield
  augeas { "sysctl_execshield_config":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set kernel.exec-sheild 1",
    ],
  }
  
  # Enable Randomized Virtual Memory Region Placement
  augeas { "sysctl_randomram_config":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set kernel.randomize_va_space 2",
    ],
  }
  
  
  # Verify Permissions on /etc/passwd
  # Verify User/Group Ownership on /etc/passwd
  file { '/etc/passwd':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  # Verify Permissions on /etc/shadow
  # Verify User/Group Ownership on /etc/shadow
  file { '/etc/shadow':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0000',
  }

  # Verify Permissions on /etc/gshadow
  # Verify User/Group Ownership on /etc/gshadow
  file { '/etc/gshadow':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0000',
  }

  # Verify Permissions on /etc/group
  # Verify User/Group Ownership on /etc/group
  file { '/etc/group':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  
  # Set Daemon umask
  augeas { "init_umask_config":
    context => "/files/etc/sysconfig/init",
    changes => [
      "set umask 027",
    ],
  }
  
  # Set Active Consoles
  augeas { "init_active_consoles":
    context => "/files/etc/sysconfig/init",
    changes => [
      "set ACTIVE_CONSOLES /dev/tty[1-2]",
    ],
  }
  
  
  # Set Runlevel To 3
  augeas { "inittab_runlevel_config":
    context => "/files/etc/inittab",
    changes => [
      "set id/runlevels 3",
    ],
  }

}