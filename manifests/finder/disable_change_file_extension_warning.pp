# Public: Disables the warning when changing a file extension
#
# enable - wether to enable or disable the warning (defaults to false).
#
# Examples
#
#   # disable the change file extension warning
#   include osx::finder::disable_change_file_extension_warning
class osx::finder::disable_change_file_extension_warning($enable = false) {
  boxen::osx_defaults { 'change file extension warning':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => $enable,
    notify => Exec['killall Finder'];
  }
}
