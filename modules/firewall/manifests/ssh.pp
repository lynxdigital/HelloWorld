class firewall::ssh {

  # Call Classes
  include firewall::install, firewall::config::default, firewall::config::ssh, firewall::service

}