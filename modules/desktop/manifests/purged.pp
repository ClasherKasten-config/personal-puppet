class desktop::purged {
  exec { 'remove firefox snap'
    command => 'sudo snap remove firefox',
  } ->
  $purged = [
    'command-not-found', 'gitk', 'libreoffice-common',
    'printer-driver-foo2zjs', 'snapd',
  ]
  package {$purged: ensure => 'purged'}
}
