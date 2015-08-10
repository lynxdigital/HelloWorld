class ruby::app::helloWorld {

  # Include Base Server Config
  include base
  include ruby::passenger::install
  include ruby::gem::sinatra

  # Deploy Git Code
  git::clone {'helloWorld':
    source   => 'https://github.com/tnh/simple-sinatra-app.git',
    target   => '/srv/www/helloWorld',
    owner    => 'apache',
    require  => [Class['ruby::gem::sinatra'],Class['ruby::passenger::install']],
  }

  # Create Public Folder For Linking Web Server
  file { '/srv/www/helloWorld/public':
    ensure   => 'directory',
    owner    => 'apache',
    group    => 'apache',
    mode     => '0644',
    require  => Git::Clone['helloWorld'],
  }

  # Create Link In Main Site
  file {'/var/www/html/helloworld':
    ensure  => 'link',
    target  => '/srv/www/helloWorld/public',
    require => [Git::Clone['helloWorld'],File['/srv/www/helloWorld/public']],
  }

}
