class secure::server {

  # Load Stages
  require base::stages

  # Secure Networking Componenets
  class { 'secure::server::networking':
    stage => 'post',
  }

  # Secure System Componenets
  class { 'secure::server::config':
    stage => 'post',
  }

  # Secure Filesystem Componenets
  class { 'secure::server::filesystem':
    stage => 'post',
  }

  # Diable Insecure Services
  class { 'secure::server::disable':
    stage => 'post',
  }
}