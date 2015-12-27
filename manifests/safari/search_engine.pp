# Public: Changes the search engine
#
# Examples
#
#   # Changes the search engine to DuckDuckGo by default
#   include osx::safari::search_engine
#
#   # Or pick a different one:
#   class { 'osx::safari::search_engine':
#     search_engine => 'com.yahoo.www'
#   }
#
class osx::safari::search_engine ($search_engine = 'com.duckduckgo'){
  boxen::osx_defaults { 'change search engine, defaults to DuckDuckGo':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'SearchProviderIdentifier',
    value  => $search_engine,
    user   => $::boxen_user
  }
}
