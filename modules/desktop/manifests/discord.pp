class desktop::discord(String $url, String $archive_name) {
  exec { 'Download Discord':
    command => "/usr/bin/wget -O /tmp/${archive_name}.deb \"${url}\"",
    creates => "/tmp/${archive_name}.deb",
  } ->
  package { 'discord':
    ensure   => 'latest',
    provider => 'dpkg',
    source   => "/tmp/${archive_name}.deb"
  }
}
