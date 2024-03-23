class desktop::chrome(String $url, String $archive_name) {
  exec { 'Download Chrome':
    command => "/usr/bin/curl -L -o /tmp/${archive_name}.deb ${url}",
    creates => "/tmp/${archive_name}.deb",
    require => Package['curl'],
  } ->
  package { 'chrome':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => "/tmp/${archive_name}.deb"
  }
}
