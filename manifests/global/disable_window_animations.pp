# Public: Disables opening and closing window animations
#
# enable - wether to enable or disable window animations (defaults to false).
#
# Examples
#
#   # disable window animations
#   include osx::global::disable_window_animations
class osx::global::disable_window_animations($enable = false) {
  boxen::osx_defaults { 'window animations':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticWindowAnimationsEnabled',
    value  => $enable;
  }
}
