class ruby::gem::sinatra {

  # Sinatra Require Bundler Gem
  require ruby::gem::bundler

  # Install Sinatra Gem
  ruby::gem::install { 'sinatra':
    gem => 'sinatra'
  }

}