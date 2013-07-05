class accounts::user::user {

  # Add User Account
  accounts::add_user { 'user':
    ensure    => 'present',
    comment   => 'System User',
    uid       => '10000',
    pri_group => 'operations',
  }

  # User Public SSH Key
  accounts::add_ssh_key { 'user':
    ensure => 'present',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDs5tbmpWHYtletb5bk8w5fhLi9CBAZP5/8kzTNmS8fZVBD/y/QVxDl/yK1xF1BAf5FaTB5/BwbFIYWMZ7j3HtAYdJ3CXNf+cs0cY2XKdpohnJMBJ4xtgJN3elECiK/lhu1gYTM/cAy5Glkim9O/OOMi0RMlWPzAXlyFsxnhD3oqvCDK2Ya2ebt4BknxHnP9ZQ6XOd0ZPlQkllqgcuBWBkn6S/sMrMB4VnQMd4W5XYyk+x1IUZmC/pVc9coqMbthf6JNqrJo+fy+q725+r8fwHLaEedK3dQiPe35YY2uYrraa8g2LqMbhERkoalwCXkRqqkk1ILMNIU34mmR7K9grAZ',
  }

  # Grant Sudo Access
  sudo::user::config { 'user':
    type => 'nopasswd',
  }

}
