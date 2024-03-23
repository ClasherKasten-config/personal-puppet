# need to change how this works... but don't know how yet 🥲

class desktop::workspace {
  file { '/home/clasherkasten/workspace':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
  }

  # $repos = [
  #   'asottile/all-repos', 'clasherkasten/babi', 'asottile/pyupgrade',
  #   'pre-commit/pre-commit', 'pre-commit/pre-commit-hooks',
  # ]

  # $repos.each |$repo| {
  #   $name = basename($repo)
  #   vcsrepo { "/home/clasherkasten/workspace/${name}":
  #     ensure   => 'present',
  #     user     => 'clasherkasten',
  #     provider => 'git',
  #     source   => "git@github.com:${repo}",
  #   }
  # }
}
