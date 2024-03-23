class packages::latex {
  package { ['texlive', 'texlive-lang-german', 'texlive-latex-extra']:
    ensure  => 'latest',
    require => Exec['apt_update'],
  }
}
