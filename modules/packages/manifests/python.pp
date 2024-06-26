class packages::python {
  $ubuntu_pkgs = ['python2-dev', 'python3-dev', 'python3-distutils']
  package { $ubuntu_pkgs: ensure => 'latest' } ->
  file { '/etc/python3.10/sitecustomize.py':
    ensure  => present,
    content => '',
  }

  $deadsnakes_pkgs = [
    'python3.8-dev', 'python3.8-distutils',
    'python3.9-dev', 'python3.9-distutils',
    'python3.11-dev',
    'python3.12-dev',
    'python3.13-dev',
  ]
  apt::ppa { 'ppa:deadsnakes/ppa': } ->
  package { $deadsnakes_pkgs:
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
  package { ['python3.8-tk', 'python3.9-tk', 'python3.11-tk', 'python3.12-tk', 'python3.13-tk']:
    ensure  => 'latest',
    require => Exec['apt_update']
  }
}
