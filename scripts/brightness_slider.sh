#!/bin/bash
CSS_FILE="$HOME/.config/edgelight/configs/shared.css"


# for waybar's status
if [[ "$1" == "status" || -z "$1" ]]; then
    VAL=$(grep 'for_grep' "$CSS_FILE" | grep -oP '0\.\d+|1\.0' | head -1)
    [[ -z "$VAL" ]] && VAL="0.80"
    

    PERCENT=$(echo "($VAL * 100) / 1" | bc)

    echo "{\"text\":\"$PERCENT%\", \"percentage\":$PERCENT}"
    exit 0
fi


# adjust brightness
CURRENT_VAL=$(grep "for_grep" "$CSS_FILE" | grep -oP '[0-9]\.[0-9]+|1\.0' | head -1)
[[ -z "$CURRENT_VAL" ]] && CURRENT_VAL="0.80"

if [[ "$1" == "up" ]]; then
    NEW_VAL=$(echo "$CURRENT_VAL + 0.05" | bc)
elif [[ "$1" == "down" ]]; then
    NEW_VAL=$(echo "$CURRENT_VAL - 0.05" | bc)
elif [[ "$1" == "lowest" ]]; then
    NEW_VAL=0.00
elif [[ "$1" == "highest" ]]; then
    NEW_VAL=1.00
fi


# limiter
if (( $(echo "$NEW_VAL > 1.0" | bc -l) ));then
    NEW_VAL="1.00";
fi

if (( $(echo "$NEW_VAL < 0.0" | bc -l) )); then
    NEW_VAL="0.00";
fi


# save and signal
FINAL_VAL=$(printf "%.2f" "$NEW_VAL")
sed -i "s/@define-color edge_light.*/@define-color edge_light rgba(255, 255, 255, $FINAL_VAL);  \/* for_grep *\//" "$CSS_FILE"

pkill -RTMIN+10 waybar