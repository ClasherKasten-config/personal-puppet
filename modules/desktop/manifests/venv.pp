class desktop::venv {
  $packages = [
    'aactivator', 'babi', 'flake8', 'pre-commit', 'tox', 'twine',
    'virtualenv', 'rustenv', 'rubyvenv', 'podman-compose'
  ]
  $venv = '/home/clasherkasten/opt/venv'

  util::virtualenv { $venv: venv => $venv }

  # TODO: this is quite slow, ideally I'd like something like
  # venv { '/home/clasherkasten/opt/venv':
  #     user => 'clasherkasten',
  #     packages => $packages,
  # }
  $packages.each |$pkg| {
    util::pip {"${venv}(${pkg})":
      pkg     => $pkg,
      venv    => $venv,
      require => Util::Virtualenv[$venv],
    }
  }

  $packages.each |$bin| {
    file { "/home/clasherkasten/bin/${bin}":
      ensure  => 'link',
      target  => "${venv}/bin/${bin}",
      owner   => 'clasherkasten',
      group   => 'clasherkasten',
      require => [
        File['/home/clasherkasten/bin'],
        Util::Pip["${venv}(${bin})"],
      ],
    }
  }

}
