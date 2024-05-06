class packages::utilities {
  $tools = [
    'curl', 'dos2unix', 'ffmpeg', 'graphviz', 'inotify-tools', 'jq',
    'neofetch', 'ncdu', 'plocate', 'rlwrap', 'sqlite3', 'tmux', 'tree',
    'xclip', 'fd-find', 'fzf', 'cifs-utils'
  ]
  package { $tools: ensure => 'latest' }
}
