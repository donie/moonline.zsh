autoload -Uz vcs_info

zstyle ':vcs_info:*' enable bzr git hg svn cvs
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "%r:%b %m%u%c (%a)"
zstyle ':vcs_info:*:*' formats "%r:%b %m%u%c"
zstyle ':vcs_info:*:*' nvcsformats ""

precmd() {
  psvar=()
  vcs_info
  psvar[1]="$(short_pwd)"
  psvar[2]="$(date +%T)"
  [[ -n $vcs_info_msg_0_ ]] && psvar[2]="$vcs_info_msg_0_"
}

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
  current_path_short "%1v"
  vcs_info "%2v"
)
