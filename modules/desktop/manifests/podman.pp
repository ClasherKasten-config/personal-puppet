class desktop::podman {
  file { '/home/clasherkasten/bin/docker':
    ensure  => 'link',
    target  => '/usr/bin/podman',
    owner   => 'clasherkasten',
    group   => 'clasherkasten',
    require => [Package['podman'], File['/home/clasherkasten/bin']],
  }
}
