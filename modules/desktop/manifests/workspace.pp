class desktop::workspace {
  file { '/home/clasherkasten/workspace':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  }

  $repos = [
    'clasherkasten/all-repos', 'clasherkasten/babi', 'clasherkasten/pyupgrade',
    'pre-commit/pre-commit', 'pre-commit/pre-commit-hooks',
  ]

  $repos.each |$repo| {
    $name = basename($repo)
    vcsrepo { "/home/clasherkasten/workspace/${name}":
      ensure   => 'present',
      user     => 'clasherkasten',
      provider => 'git',
      source   => "git@github.com:${repo}",
    }
  }
}
