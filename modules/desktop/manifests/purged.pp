class desktop::purged {
  $purged = ['command-not-found', 'gitk', 'printer-driver-foo2zjs', 'snapd', 'thunderbird']

  package { $purged:
    ensure   => 'purged',
  }
}
