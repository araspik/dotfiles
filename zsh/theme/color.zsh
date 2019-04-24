#   ZSh Config: Themes
# ======================
#
# Colors
# ======
# Solarized Dark based (only set on virtual TTYs).

THEME=("002b36" "dc322f" "859900" "b58900" "268bd2" "d33682" "2aa198" "93a1a1")
THEME_BRIGHT=($THEME)
THEME_BRIGHT[1]="586e75"
THEME_BRIGHT[2]="cb4b16"
THEME_BRIGHT[8]="fdf6e3"

if [ "$TERM" = "linux" ]; then for i in {0..7}; do
	printf "\e]P%x%s" $i $THEME[$(($i+1))]
	printf "\e]P%x%s" $(($i+8)) $THEME_BRIGHT[$(($i+1))]
done; fi
