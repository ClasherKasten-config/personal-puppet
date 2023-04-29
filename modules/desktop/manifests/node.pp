class desktop::node(String $node, String $archive_name, String $sha256) {
  file { "/home/clasherkasten/opt/${archive_name}":
    ensure  => 'directory',
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => File['/home/clasherkasten/opt'],
  } ->
  archive { "/tmp/${archive_name}.tar.xz":
    ensure        => 'present',
    source        => "https://nodejs.org/dist/${node}/${archive_name}.tar.xz",
    checksum      => $sha256,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => {'unxz' => '-c', 'tar' => '--strip-components=1 -xf'},
    extract_path  => "/home/clasherkasten/opt/${archive_name}",
    creates       => "/home/clasherkasten/opt/${archive_name}/bin/node",
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  ['node', 'npm', 'npx', 'corepack'].each |$bin| {
      file { "/home/clasherkasten/bin/${bin}":
        ensure  => 'link',
        target  => "/home/clasherkasten/opt/${archive_name}/bin/${bin}",
        owner   => 'clasherkasten',
        group   => 'clasherkasten',
        require => [
          File['/home/clasherkasten/bin'],
          Archive["/tmp/${archive_name}.tar.xz"],
        ],
      }
  }

  tidy { 'purge old node versions':
    path    => '/home/clasherkasten/opt',
    recurse => 1,
    rmdirs  => true,
    matches => ['node-*'],
  }
}
