class packages::texstudio {
  package { 'textstudio':
    ensure => 'latest',
    require => Exec['apt_update'],
  }
}