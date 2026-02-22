# sleep 0.15
# hyprctl dispatch pass LSuper
# hyprctl dispatch mouse 0
while hyprctl devices -j | jq -e '.keyboards[].mainModActive | select(. == true)' > /dev/null; do
    sleep 0.01
done
wlrctl pointer click left
# sleep 0.1
