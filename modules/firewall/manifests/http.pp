class firewall::http {

  # Call Classes
  include firewall::install, firewall::config::default, firewall::config::http, firewall::service

}
