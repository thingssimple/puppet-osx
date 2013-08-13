# dock pinning

class osx::dock::pinning($position = 'middle') {
  include osx::dock

  validate_re(
    $position,
    '^(start|middle|end)$',
    "osx::dock::orientation([position] must be one of the following:\
      start, middle, end; is ${position}")

  boxen::osx_defaults { 'Set the Position of Dock along Edge of the Desktop':
    user   => $::boxen_user,
    key    => 'pinning',
    domain => 'com.apple.dock',
    value  => $position,
    notify => Exec['killall Dock'];
  }
}
