(){
  local i
  for i in {1..$MOONLINE_LEFT_LINE}; do
    eval "MOONLINE_COLOR_LEFT${i}_1=(15 234)"
    eval "MOONLINE_COLOR_LEFT${i}_2=(15 236)"
    eval "MOONLINE_COLOR_LEFT${i}_3=(15 238)"
    eval "MOONLINE_COLOR_LEFT${i}_4=(15 240)"
  done
}

MOONLINE_COLOR_RIGHT1=(15 240)
MOONLINE_COLOR_RIGHT2=(15 238)
MOONLINE_COLOR_RIGHT3=(15 236)
MOONLINE_COLOR_RIGHT4=(15 234)

if [ "$USER" = 'root' ]
  then
    MOONLINE_COLOR_LEFT1_1=(15 1)
  else
    MOONLINE_COLOR_LEFT1_1=(15 2)
fi
MOONLINE_COLOR_LEFT1_2=(15 238)
MOONLINE_COLOR_RIGHT1=(15 238)
