class packages::low_level {
  package { ['gcc', 'g++', 'make', 'cmake']:
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
}
