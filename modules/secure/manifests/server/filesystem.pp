class secure::server::filesystem {

  # Include Blacklist Module File Setup
  include secure::blacklist::file

  # Disable Mounting Of Unused Filesystems
  $blacklist= ['cramfs', 'freexfs', 'jffs2', 'hfs', 'hfsplus', 'squashfs', 'udf']
  secure::blacklist::module { $blacklist: }

}