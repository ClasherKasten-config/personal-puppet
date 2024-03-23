class packages::maths {
  package { 'geogebra-gnome':
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
}
