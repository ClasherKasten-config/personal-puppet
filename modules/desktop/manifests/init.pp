class desktop {
  include desktop::background
  include desktop::discord
  include desktop::dotfiles
  include desktop::drawio
  include desktop::chrome
  include desktop::homedir
  include desktop::launcher
  include desktop::node
  include desktop::openjdk
  include desktop::podman
  include desktop::purged
  include desktop::pypy
  include desktop::screensaver
  include desktop::telegram
  include desktop::venv
  include desktop::vscode
  include desktop::wayland
  include desktop::workspace

  include packages::build_deps
  include packages::editors
  include packages::embedded
  include packages::firefox
  include packages::gnome_terminal
  include packages::latex
  include packages::low_level
  include packages::maths
  include packages::podman
  include packages::python
  include packages::texstudio
  include packages::utilities
}
