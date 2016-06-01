MOONLINE_COMPONENTS+=(
  username "%n"
  hostname "%M"
  current_path "%~"
  current_directory "%."
  jobs "%j"
  date "%D"
  time "%*"
  datetime "%d %*"
  status "%(?..%{%F{red}%})%?"
  username_hostname_ssh "%n${SSH_TTY:+@%M}"
)
