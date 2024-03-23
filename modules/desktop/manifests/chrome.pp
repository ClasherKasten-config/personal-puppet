class desktop::chrome(String $url, String $archive_name) {
  exec { 'Download Discord':
    command => "curl -L -o /tmp/${archive_name}.deb ${url}",
    creates => "/tmp/${archive_name}.deb",
    require => Package['curl'],
  }

  package { 'chrome':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => "/tmp/${archive_name}.deb"
  }
}
