# Public: Disables menu bar transparency.
#
# enable - wether to enable or disable transparency (defaults to false).
#
# Examples
#   # disable transparency
#   include osx::global::disable_menu_bar_transparency
#
#   # enable transparency
#   class { 'osx::global::disable_menu_bar_transparency':
#     enable => true
#   }
class osx::global::disable_menu_bar_transparency($enable = false) {
  boxen::osx_defaults { 'menu bar transparency':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMenuBarTransparency',
    value  => $enable;
  }
}
