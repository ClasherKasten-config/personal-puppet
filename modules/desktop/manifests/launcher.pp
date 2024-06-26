# find settings and know what i have updated...

class desktop::launcher {
  gsetting { 'org.gnome.shell favorite-apps':
    ensure => [
      'org.gnome.Nautilus.desktop',
      'org.gnome.Terminal.desktop',
      'firefox.desktop',
      'gnome-control-center.desktop',
    ],
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.shell.extensions.dash-to-dock multi-monitor':
    ensure => ':true',
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.shell.extensions.dash-to-dock dock-position':
    ensure => 'RIGHT',
    user   => 'clasherkasten',
  }
  gsetting { 'org.gnome.shell.extensions.dash-to-dock show-mounts':
    ensure => ':false',
    user   => 'clasherkasten',
  }

  gsetting { 'org.gnome.shell.extensions.dash-to-dock show-trash':
    ensure => ':false',
    user   => 'clasherkasten',
  }

  gsetting { 'org.gnome.shell.extensions.dash-to-dock autohide':
    ensure => ':true',
    user   => 'clasherkasten',
  }

  gsetting { 'org.gnome.shell.extensions.ding show-home':
    ensure => ':false',
    user   => 'clasherkasten',
  }
}
