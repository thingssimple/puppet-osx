# Public: Disables search engine suggestions in Safari
#
# Examples
#
#   include osx::safari::disable_search_suggestions
#
class osx::safari::disable_search_suggestions {
  boxen::osx_defaults { 'disable search engine suggestions':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'SuppressSearchSuggestions',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }
}
