class yum::plugin::protectBase {

  # Protect The Base Installation From Third Party Repositories
  yum::plugin::install { 'protect-base':
    plugin => 'protectbase',
  }

}