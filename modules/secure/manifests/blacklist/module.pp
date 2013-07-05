define secure::blacklist::module {

  # Write Module To Blacklist File
  concat::fragment { "blacklist_mod_${name}":
    target  => '/etc/modprobe.d/custom.conf',
    content => "install ${name} /bin/true\n",
    order   => 02,
  }

}