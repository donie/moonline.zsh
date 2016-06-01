function prompt_sorin_pwd {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    _prompt_sorin_pwd="$MATCH"
    unset MATCH
  else
    _prompt_sorin_pwd="${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

precmd() {
  psvar=()
  prompt_sorin_pwd
  psvar[1]="$_prompt_sorin_pwd"
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
  username_hostname_ssh "%n${SSH_TTY:+@%M}"
  current_path_sorin "%1v"
)
