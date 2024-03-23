class desktop::homedir {
  file { [
    '/home/clasherkasten/Pictures',
    '/home/clasherkasten/Public',
    '/home/clasherkasten/Templates',
    '/home/clasherkasten/Videos',
    '/home/clasherkasten/Music',
    '/home/clasherkasten/snap',
  ]:
    ensure  => 'absent',
    recurse => true,
    force   => true,
  }

  file { ['/home/clasherkasten/bin', '/home/clasherkasten/opt']:
    ensure => 'directory',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  }
}
