#!/usr/bin/env bash

# paths
PIDFILE="$HOME/.cache/edgelight.pids"
LIGHT_DIR="$HOME/.config/edgelight/configs"
CSS="$LIGHT_DIR/shared.css"

# kill lights if active
if [[ -f "$PIDFILE" ]]; then
    while read -r pid; do
        kill "$pid" 2>/dev/null
    done < "$PIDFILE"
    rm -f "$PIDFILE"
    exit 0
fi


mkdir -p "$(dirname "$PIDFILE")"
: > "$PIDFILE"

# start lights & get and save PID in cache
waybar -b edge-top    -c "$LIGHT_DIR/top.jsonc"    -s "$CSS" &  echo $! >> "$PIDFILE"
sleep 0.05
waybar -b edge-bottom -c "$LIGHT_DIR/bottom.jsonc" -s "$CSS" & echo $! >> "$PIDFILE"
sleep 0.05
waybar -b edge-left   -c "$LIGHT_DIR/left.jsonc"   -s "$CSS" &  echo $! >> "$PIDFILE"
sleep 0.05
waybar -b edge-right  -c "$LIGHT_DIR/right.jsonc"  -s "$CSS" & echo $! >> "$PIDFILE"
