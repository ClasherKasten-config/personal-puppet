class packages::texstudio {
  package { 'texstudio':
    ensure => 'latest',
    require => Exec['apt_update'],
  }
}