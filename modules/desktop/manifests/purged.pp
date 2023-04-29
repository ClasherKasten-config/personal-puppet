# run beforehand:
#     'sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount && ',
#     'sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount',


class desktop::purged {
  $purged = [
    'command-not-found', 'gitk', 'libreoffice-common',
    'printer-driver-foo2zjs', 'snapd',
  ]
  package { $purged:
    ensure   => 'purged',
  }
}
