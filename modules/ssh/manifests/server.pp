class ssh::server {

  # Call Classes
  #include ssh::server::install, ssh::server::config, ssh::server::service, firewall::ssh
  include ssh::server::install, ssh::server::service, firewall::ssh

}
