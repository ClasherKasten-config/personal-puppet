# go back to jdk17? more compatibility evtl.

class desktop::openjdk(String $openjdk, String $url, String $sha256) {
  $java_binaries = [
    'java', 'javac', 'javadoc', 'jar', 'jconsole', 'jdb',
    'jstack', 'jstat', 'jcmd', 'jarsigner', 'jhat', 'jinfo',
    'jmap', 'jps', 'jrunscript'
  ]

  file { "/home/clasherkasten/opt/openjdk-${openjdk}":
    ensure  => 'directory',
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => File['/home/clasherkasten/opt'],
  } ->
  archive { "/tmp/openjdk-${openjdk}.tar.gz":
    ensure        => 'present',
    source        => $url,
    checksum      => $sha256,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => '--strip-components=1 -xf',
    extract_path  => "/home/clasherkasten/opt/openjdk-${openjdk}",
    creates       => "/home/clasherkasten/opt/openjdk-${openjdk}/bin/java",
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  $java_binaries.each |$bin| {
      file { "/home/clasherkasten/bin/${bin}":
        ensure  => 'link',
        target  => "/home/clasherkasten/opt/openjdk-${openjdk}/bin/${bin}",
        owner   => 'clasherkasten',
        group   => 'clasherkasten',
        require => [
          File['/home/clasherkasten/bin'],
          Archive["/tmp/openjdk-${openjdk}.tar.gz"],
        ],
      }
  }

  tidy { 'purge old openjdk versions':
    path    => '/home/clasherkasten/opt',
    recurse => 1,
    rmdirs  => true,
    matches => ['openjdk-*'],
  }
}
