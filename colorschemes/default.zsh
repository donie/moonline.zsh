(){
  local i
  for i in {1..$MOONLINE_LEFT_LINE}; do
    eval "MOONLINE_COLOR_LEFT${i}_1=(15 232)"
    eval "MOONLINE_COLOR_LEFT${i}_2=(15 234)"
    eval "MOONLINE_COLOR_LEFT${i}_3=(15 236)"
    eval "MOONLINE_COLOR_LEFT${i}_4=(15 238)"
  done
}
MOONLINE_COLOR_LEFT1_1=(15 2)

MOONLINE_COLOR_RIGHT1=(15 8)
MOONLINE_COLOR_RIGHT2=(15 8)
MOONLINE_COLOR_RIGHT3=(15 8)
MOONLINE_COLOR_RIGHT4=(15 8)