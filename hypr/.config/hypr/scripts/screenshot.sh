#!/usr/bin/env bash
# Screenshot helper for Hyprland (grim + slurp + satty)
#
#   screenshot.sh area     select area   -> annotate in satty
#   screenshot.sh full     all monitors  -> annotate in satty
#   screenshot.sh window   active window -> annotate in satty
#   screenshot.sh monitor  focused monitor -> annotate in satty
#   screenshot.sh copy     select area   -> clipboard (no editor)
#   screenshot.sh ocr      select area   -> recognised text to clipboard
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

args=(-l 3)
case $1 in
    area | copy | ocr)
        geo=$(select_area) || exit 0 # Esc in slurp = cancelled
        args+=(-g "$geo")
        ;;
    window)
        geo=$(hyprctl -j activewindow | jq -er 'select(.at) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"') ||
            { notify "No active window"; exit 1; }
        args+=(-g "$geo")
        ;;
    monitor)
        args+=(-o "$(hyprctl -j monitors | jq -r '.[] | select(.focused).name')")
        ;;
    full) ;;
    *)
        echo "usage: ${0##*/} <area|full|window|monitor|copy|ocr>" >&2
        exit 2
        ;;
esac

case $1 in
    copy)
        grim "${args[@]}" - | wl-copy -t image/png && notify "Screenshot copied"
        ;;
    ocr)
        text=$(grim "${args[@]}" - | tesseract - - 2>/dev/null)
        if [[ -z ${text//[[:space:]]/} ]]; then
            notify "No text found"
        else
            printf '%s' "$text" | wl-copy
            notify "Text copied" "${text:0:120}"
        fi
        ;;
    *)
        grim "${args[@]}" - | satty -f -
        ;;
esac
