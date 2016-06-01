# set shell varibles

# moonline.zsh installed directory's path
MOONLINE_HOME="$(cd "$(dirname ${0})"; pwd)"

# moonline.zsh prompt's separatos (left right)
MOONLINE_SEPARATOR=('' '')
MOONLINE_SUBSEPARATOR=('|' '|')

# moonline.zsh components
typeset -A MOONLINE_COMPONENTS
# load components
(){
  local component_file
  for component_file ($MOONLINE_HOME/components/*.zsh); do
    source $component_file
  done
}

# moonline.zsh default prompt
# number of left prompt line
MOONLINE_LEFT_LINE=1
# left prompt groups (max 4)
if [ "$USER" = 'root' ]
  then
    MOONLINE_LEFT1_1=(hostname)
  else
    MOONLINE_LEFT1_1=(username_hostname_ssh)
fi
MOONLINE_LEFT1_2=(current_path_sorin)
# right prompt groups (max 4)
MOONLINE_RIGHT1=(vcs_info)

# moonline.zsh find colorscheme using this pathes
MOONLINE_COLORSCHEME_PATH=''
typeset -U MOONLINE_COLORSCHEME_PATH moonline_colorscheme_path
moonline_colorscheme_path=(
  $MOONLINE_HOME/colorschemes
)

# colorscheme using moonline.zsh
MOONLINE_COLORSCHEME="default"

# set fpath for autoload and completion
fpath=(
  "$MOONLINE_HOME/subcommands"
  "$MOONLINE_HOME/completions"
  $fpath
)

# setup completion
autoload -Uz _moonline; compdef _moonline moonline
# define subcommands
(){
  local subcommand
  for subcommand ($MOONLINE_HOME/subcommands/*); do
    autoload -Uz $subcommand:t
  done
}

# implementation of moonline command
moonline() {
  which moonline-${1} &>/dev/null || {
    echo "${1} is not subcommand!"
    return 1
  } && moonline-${1} ${*[2,-1]}
}
