#!/run/current-system/sw/bin/bash
case $1 in
  "screenshot")
    grim -g "$(slurp -d)" - | wl-copy -t image/png
    ;;
  "shutdown")
    systemctl poweroff
    ;;
esac
