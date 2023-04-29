class desktop::purged {
  exec { 'remove firefox snap'
    command => 'sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount && ',
  }
  $purged = [
    'command-not-found', 'gitk', 'libreoffice-common',
    'printer-driver-foo2zjs', 'snapd',
  ]
  package { $purged:
    ensure   => 'purged',
    required => Exec['remove firefox snap']
  }
}
