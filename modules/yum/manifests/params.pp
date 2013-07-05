class yum::params {
  
  # Define Default Parameters For Yum Module
  # This Can Be Overridden With Top Scope Variables
  $cacheDir          = $::yum_cacheDir ? { undef => '/var/cache/yum/$basearch/$releasever', default => $::yum_cacheDir }
  $keepCache         = $::yum_keepCache ? { true => '1', false => '0', undef => '0', default => $::yum_keepCache }
  $debugLevel        = $::yum_debugLevel ? { undef => '2', default => $::yum_debugLevel }
  $logFile           = $::yum_logFile ? { undef => '/var/log/yum.log', default => $::yum_logFile }
  $exactArch         = $::yum_exactArch ? { true => '1', false => '0', undef => '1', default => $::yum_exactArch}
  $obsoletes         = $::yum_obsoletes ? { true => '1', false => '0', undef => '1', default => $::yum_obsoletes}
  $gpgCheck          = $::yum_gpgCheck ? { true => '1', false => '0', undef => '1', default => $::yum_gpgCheck}
  $plugins           = '1'
  $installOnlyLimit  = $::yum_installOnlyLimit ? { undef => '5', default => $::yum_installOnlyLimit }
  $bugTrackerUrl     = $::yum_bugTrackerUrl ? { undef => undef, default => $::yum_bugTrackerUrl }
  $distroVerPkg      = $::yum_distroVerPkg ? { undef => 'centos-release', default => $::yum_distroVerPkg }

}