# Public: Show internal drives on the desktop.
class osx::finder::show_hard_drives_on_desktop($enable = true)  {
  include osx::finder

  boxen::osx_defaults { 'Show internal drives on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowHardDrivesOnDesktop',
    value  => $enable,
    notify => Exec['killall Finder'];
  }
}
