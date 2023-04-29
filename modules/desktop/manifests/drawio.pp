class desktop::drawio(String $drawio, String $archive_name, String $sha256) {
  file { "/tmp/${archive_name}.deb":
    ensure        => 'present',
    source        => "https://github.com/jgraph/drawio-desktop/releases/download/${drawio}/${archive_name}.deb",
    checksum      => $sha256,
    checksum_type => 'sha256',
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  package { 'draw.io':
    provider => dpkg,
    source   => "/tmp/${archive_name}.deb",
  }
}