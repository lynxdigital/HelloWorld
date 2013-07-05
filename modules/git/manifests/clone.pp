define git::clone (
  $source = undef,
  $target = undef,
  $owner = 'apache',
) {

  # Include Install If Required
  include git::install

  # Clone Repository From Git To Target Directory
  vcsrepo { $target:
    ensure   => 'latest',
    owner    => $owner,
    group    => $owner,
    provider => git,
    source   => $source,
    revision => 'master',
    require  => Class['git::install'],
  }

}

