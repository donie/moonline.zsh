function prompt_sorin_pwd {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    _prompt_sorin_pwd="$MATCH"
    unset MATCH
  else
    _prompt_sorin_pwd="${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

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
  prompt_sorin_pwd
  psvar[1]="$_prompt_sorin_pwd"
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
  current_path_sorin "%1v"
  vcs_info "%2v"
)
