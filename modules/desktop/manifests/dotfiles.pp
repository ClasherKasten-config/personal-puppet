class desktop::dotfiles {
  $dotfiles = [
    '.bashrc', '.bash_aliases', '.gitconfig', '.hgrc', '.nanorc', '.pdbrc',
    '.pypirc', '.pythonrc.py', '.tmux.conf',
  ]
  $binfiles = [
    'bash/git-happy-merge', 'python/best-of', 'python/bump',
    'python/git-github-compare',
    'python/git-github-fork', 'python/git-github-url',
    'python/inotify-exec', 'python/prune-remote-branches',
  ]

  vcsrepo { '/home/clasherkasten/.oh-my-bash':
    ensure   => 'present',
    user     => 'clasherkasten',
    provider => 'git',
    source   => 'git@github.com:ClasherKasten-config/oh-my-bash',
  } ->
  vcsrepo { '/home/clasherkasten/.scratch':
    ensure   => 'present',
    user     => 'clasherkasten',
    provider => 'git',
    source   => 'git@github.com:ClasherKasten-config/scratch',
  }

  $dotfiles.each |$f| {
    file { "/home/clasherkasten/${f}":
      ensure  => 'link',
      target  => "/home/clasherkasten/.scratch/${f}",
      owner   => 'clasherkasten',
      group   => 'clasherkasten',
      require => Vcsrepo['/home/clasherkasten/.scratch'],
    }
  }

  $binfiles.each |$f| {
    file { "/home/clasherkasten/bin/${basename($f)}":
      ensure  => 'link',
      target  => "/home/clasherkasten/.scratch/${f}",
      owner   => 'clasherkasten',
      group   => 'clasherkasten',
      require => [
        Vcsrepo['/home/clasherkasten/.scratch'],
        File['/home/clasherkasten/bin'],
      ],
    }
  }

  # many scripts use this, though we can't set contents quite yet
  file { '/home/clasherkasten/.github-auth.json':
    ensure => 'present',
    owner  => 'clasherkasten',
    group  => 'clasherkasten',
    mode   => '0600',
  }
}
