# Public: Set verbose boot mode
class osx::system::verbose_boot(
  $ensure = 'present',
) {

  if $ensure == 'present' {
    exec { 'Set Verbose Boot NVRAM Flag':
      command => "nvram boot-args='-v'",
      unless  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
      user    => root,
    }
  } else {
    exec { 'Remove Verbose Boot NVRAM Flag':
      command => 'nvram boot-args=',
      onlyif  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
      user    => root
    }
  }
}
