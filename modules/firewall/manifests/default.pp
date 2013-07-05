class firewall::default {

  # Call Classes
  include firewall::install, firewall::config::default, firewall::service

}