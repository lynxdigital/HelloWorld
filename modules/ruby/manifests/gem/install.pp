define ruby::gem::install (
  $gem = undef,
) {

  # Requires Ruby And Rubygems
  require ruby::install

  if $gem == undef { $lclGem=$name } else { $lclGem = $gem }

  # Install Ruby Gem File
  package { $lclGem:
    ensure        => 'present',
    provider      => 'gem',
  }

}
