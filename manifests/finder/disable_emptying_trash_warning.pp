# Public: Disables the warning when emptying the trash.
#
# enable - wether to enable or disable the warning (defaults to false).
#
# Examples
#
#   # disable emptying trash warning
#   include osx::finder::disable_emptying_trash_warning
class osx::finder::disable_emptying_trash_warning($enable = false) {
  boxen::osx_defaults { 'emptying trash warning':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'WarnOnEmptyTrash',
    value  => $enable,
    notify => Exec['killall Finder'];
  }
}
