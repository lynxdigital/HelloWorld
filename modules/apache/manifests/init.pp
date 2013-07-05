class apache  {

  # Call Classes
  include apache::install, apache::config, apache::service

  # Open Firewall Port
  include firewall::http

}