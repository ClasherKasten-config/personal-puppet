class desktop::discord(String $url, String $archive_name) {
  exec { 'Download Discord':
    command => "curl -L -o ${archive_name}.deb ${url}",
    creates => "/tmp/${archive_name}.deb",
    require => Package['curl'],
  }

  package { 'discord':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => "/tmp/${archive_name}.deb"
  }
}
