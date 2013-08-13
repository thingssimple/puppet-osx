# Public: Show removable media on the desktop.
class osx::finder::show_removable_media_on_desktop($enable = true)  {
  include osx::finder

  boxen::osx_defaults { 'Show mounted media on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowRemovableMediaOnDesktop',
    value  => $enable,
    notify => Exec['killall Finder'];
  }
}
