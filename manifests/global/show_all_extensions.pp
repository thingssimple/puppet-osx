# Public: Show all filename extensions in Finder.
#
# enable - wether to show all filename extensions (defaults to true).
#
# Examples
#
#   # show all filename extensions
#   include osx::global::show_all_extensions
class osx::global::show_all_extensions($enable = true) {
  boxen::osx_defaults { 'show all filename extensions':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowAllExtensions',
    value  => $enable;
  }
}
