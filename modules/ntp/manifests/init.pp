class ntp (
  $ntp_client_subnets = $::ntp_client_subnets ? { undef => undef , default => $::ntp_client_subnets },
  $ntp_server_mode    = $::ntp_server_mode    ? { undef => false , default => $::ntp_server_mode },
  $ntp_servers        = $::ntp_servers        ? { undef => '0.au.pool.ntp.org' , default => $::ntp_servers },
) {

  # The Variable ntp_server MUST be defined.
  if $ntp_servers == undef { fail('NTP: ntp_servers arguement needs to be defined.') }

  # Additional Server Mode Requirements
  if $ntp_server_mode == true {
    if $ntp_client_subnets == undef { fail('NTP: ntp_client_subnets arguement needs to be defined if server mode is enabled.') }
  }

  # Call Classes
  include ntp::install, ntp::config, ntp::service

}