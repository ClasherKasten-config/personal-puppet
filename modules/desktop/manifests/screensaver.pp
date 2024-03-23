class desktop::screensaver {
  gsetting { 'org.gnome.desktop.session idle-delay':
    ensure => 0,
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type':
    ensure => 'suspend',
    user   => 'clasherkasten',
  }
}
