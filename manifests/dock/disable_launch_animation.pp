# Public: Disables the dock's application launch animation.
#
# enable - wether to enable or disable the animation (defaults to false).
#
# Examples
#
#   # disable dock's application launch animation
#   include osx::dock::disable_launch_animation
class osx::dock::disable_launch_animation($enable = false) {
  boxen::osx_defaults { 'dock launc application animation':
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'launchanim',
    value  => $enable,
    notify => Exec['killall Dock'];
  }
}
