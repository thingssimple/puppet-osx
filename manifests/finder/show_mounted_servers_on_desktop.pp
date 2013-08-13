# Public: Show mounted servers on the desktop.
class osx::finder::show_mounted_servers_on_desktop($enable = true)  {
  include osx::finder

  boxen::osx_defaults { 'Show mounted servers on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowMountedServersOnDesktop',
    value  => $enable,
    notify => Exec['killall Finder'];
  }
}
