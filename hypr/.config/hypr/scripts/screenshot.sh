#!/usr/bin/env bash
# Screenshot helper for Hyprland (grim + slurp + satty)
#
#   screenshot.sh area     select area     -> annotate in satty
#   screenshot.sh monitor  focused monitor -> annotate in satty
#   screenshot.sh ocr      select area     -> recognised text to clipboard
#
# Satty handles saving/copying (see ~/.config/satty/config.toml).

set -o pipefail

notify() { notify-send -a Screenshot -t 2000 "$@"; }

# Freeze the screen while selecting so menus/tooltips stay put.
select_area() {
    hyprpicker -r -z >/dev/null 2>&1 &
    local freeze=$!
    sleep 0.2
    slurp -d
    local rc=$?
    kill "$freeze" 2>/dev/null
    return $rc
}

case $1 in
    area | ocr)
        geo=$(select_area) || exit 0 # Esc in slurp = cancelled
        args=(-g "$geo")
        ;;
    monitor)
        args=(-o "$(hyprctl -j monitors | jq -r '.[] | select(.focused).name')")
        ;;
    *)
        echo "usage: ${0##*/} <area|monitor|ocr>" >&2
        exit 2
        ;;
esac

if [[ $1 == ocr ]]; then
    text=$(grim "${args[@]}" - | tesseract - - 2>/dev/null)
    if [[ -z ${text//[[:space:]]/} ]]; then
        notify "No text found"
    else
        printf '%s' "$text" | wl-copy
        notify "Text copied" "${text:0:120}"
    fi
else
    grim -l 3 "${args[@]}" - | satty -f -
fi
