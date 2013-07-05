class yum::plugin::fastestMirror {

  # Find The Fastest Available Mirror To Download From
  yum::plugin::install { 'fastest-mirror':
    plugin => 'fastestmirror',
  }

}