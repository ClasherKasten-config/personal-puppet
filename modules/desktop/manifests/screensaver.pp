class desktop::screensaver {
  gsetting { 'org.gnome.desktop.session idle-delay':
    ensure => 300,
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type':
    ensure => 'suspend',
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.desktop.screensaver lock-enabled':
    ensure => ':false',
    user   => 'clasherkasten',
  }
}
