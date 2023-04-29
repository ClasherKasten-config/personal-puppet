class desktop::vscode(String $url, String $sha256) {
  archive { "/tmp/vscode.tar.gz":
    ensure        => 'present',
    source        => $url,
    checksum      => $sha256,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => '--strip-components=1 -xf',
    extract_path  => "/home/clasherkasten/opt/vscode",
    creates       => "/home/clasherkasten/opt/vscode/bin/code",
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  file { "/home/clasherkasten/bin/code":
    ensure  => 'link',
    target  => "/home/clasherkasten/opt/vscode/bin/code",
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => [
        File['/home/clasherkasten/bin'],
        Archive["/tmp/vscode.tar.gz"],
    ],
  }
}