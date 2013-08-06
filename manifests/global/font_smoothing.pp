# Public: Enable subpixel font rendering on non-Apple LCDs
#
# value - the factor by which font smoothing will happen. Defaults to 0 (disabled).
#         Valid values are: 0 (disabled)
#                           1 (minimal)
#                           2 (medium)
#                           3 (smoother)
#                           4 (strong)
#
# Examples
#
#   # disable font smoothing (the default)
#   include osx::global::font_smoothing
#
class osx::global::font_smoothing ($value = 0) {
  boxen::osx_defaults { 'subpixel font rendering':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleFontSmoothing',
    value  => $value,
    user   => $::boxen_user;
  }
}
