# Public: Sends the do not track HTTP header in Safari
#
# Examples
#
#   include osx::safari::do_not_track
#
class osx::safari::do_not_track {
  boxen::osx_defaults { 'do not track':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'SendDoNotTrackHTTPHeader',
    type   => 'bool',
    value  => true,
    user   => $::boxen_user
  }
}
