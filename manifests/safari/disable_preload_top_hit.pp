# Public: Disable top hit background preload
#
# Examples
#
#   include osx::safari::disable_preload_top_hit
#
class osx::safari::disable_preload_top_hit {
  boxen::osx_defaults { 'disable top hit background preloading':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'PreloadTopHit',
    type   => 'bool',
    value  => false,
    user   => $::boxen_user
  }
}
