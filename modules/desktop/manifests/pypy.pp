class desktop::pypy(String $pypy3, String $sha256) {
  file { "/home/clasherkasten/opt/${pypy3}":
    ensure  => 'directory',
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => File['/home/clasherkasten/opt'],
  } ->
  archive { "/tmp/${pypy3}.tar.bz2":
    ensure        => 'present',
    source        => "https://downloads.python.org/pypy/${pypy3}.tar.bz2",
    checksum      => $sha256,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => {'tar' => '--strip-components=1 -xf'},
    extract_path  => "/home/clasherkasten/opt/${pypy3}",
    creates       => "/home/clasherkasten/opt/${pypy3}/bin/pypy3",
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  } ->
  file { '/home/clasherkasten/bin/pypy3':
    ensure  => 'link',
    target  => "/home/clasherkasten/opt/${pypy3}/bin/pypy3",
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => File['/home/clasherkasten/bin'],
  }

  tidy { 'purge old pypy versions':
    path    => '/home/clasherkasten/opt',
    recurse => 1,
    rmdirs  => true,
    matches => ['pypy*'],
  }
}
