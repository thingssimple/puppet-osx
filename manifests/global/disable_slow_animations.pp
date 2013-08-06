# Public: Disables slow animations when holding shift.
#
# enable - wether to enable or disable slow animations (defaults to false).
#
# Examples
#
#   # disable slow animations
#   include osx::global::disable_slow_animations
class osx::global::disable_slow_animations($enable = false) {
  boxen::osx_defaults { 'slow animations':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'FXEnableSlowAnimation',
    value  => $enable;
  }
}
