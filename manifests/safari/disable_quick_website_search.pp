# Public: Disable quick website search
#
# Examples
#
#   include osx::safari::disable_quick_website_search
#
class osx::safari::disable_quick_website_search {
  boxen::osx_defaults { 'disable quick website search':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'WebsiteSpecificSearchEnabled',
    type   => 'bool',
    value  => false,
    user   => $::boxen_user
  }
}
