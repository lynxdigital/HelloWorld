class ssh::server::service {

  # Configure The SSH Service Daemon
  service { "sshd":
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["ssh::server::install"]
  }

}
