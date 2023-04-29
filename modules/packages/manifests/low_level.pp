class packages::low_level {
  package { ['gcc', 'g++', 'make']:
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
}