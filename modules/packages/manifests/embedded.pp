class packages::embedded(String $url, String $sha256, String $archive_name, String $url_ocd, String $sha256_ocd, String $archive_name_ocd) {
  $gcc_executables = [
    'addr2line', 'ar', 'as', 'c++', 'c++filt', 'cpp', 'elfedit', 'g++', 'gcc',
    'gcc-12.3.1', 'gcc-ar', 'gcc-nm', 'gcc-ranlib', 'gcov', 'gcov-dump', 'gcov-tool',
    'gdb', 'gdb-add-index', 'gfortran', 'gprof', 'ld', 'ld.bfd', 'lto-dump', 'nm',
    'objcopy', 'objdump', 'ranlib', 'readelf', 'size', 'strings', 'strip'
  ]

  file { '/home/clasherkasten/opt/gcc-arm-none-eabi':
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
    extract_path  => '/home/clasherkasten/opt/gcc-arm-none-eabi',
    creates       => '/home/clasherkasten/opt/gcc-arm-none-eabi/bin',
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  file { '/home/clasherkasten/opt/openocd':
    ensure => 'directory',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  } ->
  archive { "/tmp/${archive_name_ocd}.tar.gz":
    ensure        => 'present',
    source        => $url_ocd,
    checksum      => $sha256_ocd,
    checksum_type => 'sha256',
    extract       => true,
    extract_flags => '--strip-components=1 -xf',
    extract_path  => '/home/clasherkasten/opt/openocd',
    creates       => '/home/clasherkasten/opt/openocd/bin',
    user          => 'clasherkasten',
    group         => 'clasherkasten',
    require       => Package['curl'],
  }

  $gcc_executables.each |$f| {
    file { "/home/clasherkasten/test-bin/arm-none-eabi-${f}":
      ensure => 'link',
      target => "/home/clasherkasten/opt/gcc-arm-none-eabi/bin/arm-none-eabi-${f}",
      owner  => 'clasherkasten',
      group  => 'clasherkasten',
    }
  }

  file { '/home/clasherkasten/test-bin/openocd':
    ensure => 'link',
    target => '/home/clasherkasten/opt/openocd/bin/openocd',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  }
}
