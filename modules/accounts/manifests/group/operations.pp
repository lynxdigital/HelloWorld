class accounts::group::operations {

  # Create The Operations Group
  group { 'operations':
    ensure => 'present',
    gid    => '10000',
  }

}