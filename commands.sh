#!/run/current-system/sw/bin/bash
case $1 in
  "screenshot")
    grim -g "$(slurp -d)" - | wl-copy -t image/png
    ;;
  "shutdown")
    systemctl poweroff
    ;;
  "browser")
    floorp
    ;;
  "terminal")
    kitty
    ;;
  "files")
    nemo
    ;;
  "steam")
    steam
    ;;
  "unbeatable")
    steam steam://rungameid/2240620
esac
