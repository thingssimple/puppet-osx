# TODO: Insert the rest of the colors listed in the General pref pane

class osx::appearance::colors(
  $highlight = undef,
  $main      = undef) {

  include osx::system::ui_server

  if $main != undef {

    validate_re($main, '^(blue|graphite|undef)$', "osx::appearance::colors[main] must be one of the following: blue, graphite; is ${main}")
    case $main {
      'blue':      { $main_int = 1 }
      'graphite':  { $main_int = 6 }
      default:     { $main_int = $main }
    }

    boxen::osx_defaults { 'Set the Main UI Color':
      user   => $::boxen_user,
      key    => 'AppleAquaColorVariant',
      domain => 'NSGlobalDomain',
      type   => 'int',
      value  => $main_int,
      notify => Exec['killall SystemUIServer'],
    }
  }

  if $highlight != undef {

    case $highlight {
      'graphite':  { $highlight_color = '0.780400 0.815700 0.858800' }
      'purple'  :  { $highlight_color = '0.913700 0.721600 1.000000' }
      default:     { $highlight_color = $highlight }
    }

    boxen::osx_defaults { 'Set the UI Highlight Color':
      user   => $::boxen_user,
      key    => 'AppleHighlightColor',
      domain => 'NSGlobalDomain',
      value  => $highlight_color,
      notify => Exec['killall SystemUIServer'],
    }
  }
}
