# which dotfiles did i update over the time??
# definitely bashrc! (removed oh-my-bash)

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
  package { 'fonts-powerline':
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
  vcsrepo { '/home/clasherkasten/.scratch':
    ensure   => 'present',
    user     => 'clasherkasten',
    provider => 'git',
    source   => 'https://github.com/ClasherKasten-config/scratch',
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
