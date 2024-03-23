class desktop::telegram(String $url, String $archive_name, String $sha256) {
  file { '/home/clasherkasten/opt/telegram':
    ensure => 'directory',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  } ->
  archive { "/tmp/${archive_name}.tar.gz":
    ensure        => 'present',
    source        => $url,
    checksum      => $sha256,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => '--strip-components=1 -xf',
    extract_path  => '/home/clasherkasten/opt/telegram',
    creates       => '/home/clasherkasten/opt/telegram/Telegram/Telegram',
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  # something to add it as a "visible" executable
}
