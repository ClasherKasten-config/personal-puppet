class desktop::background {
  $bg = 'file:///home/clasherkasten/.scratch/assets/dogdj.png'

  gsetting { 'org.gnome.desktop.background picture-uri':
    ensure  => $bg,
    user    => 'clasherkasten',
    require => Vcsrepo['/home/clasherkasten/.scratch'],
  } ->
  gsetting { 'org.gnome.desktop.screensaver picture-uri':
    ensure => $bg,
    user   => 'clasherkasten',
  }
}
