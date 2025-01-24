#!/usr/bin/env sh

convert_emoji() {
    # Convertir solo el emoji
     
    nerd_icon="$(echo "$1" | sed '
        s/☀️/󰖙 /g
        s/🌥️/󰖐 /g
        s/🌤️/󰖕 /g
        s/🌧️/󰖗 /g
        s/🌦️/󰼱 /g
        s/⬆️/󰜸 /g
        s/⬇️/󰜮 /g
        s/🌅/󰖛 /g
        s/🌇/󰖜 /g
        s/🌫️/ /g
        s/⛓️‍💥/ /g
    ')"
    
    echo "$nerd_icon" "$2"
}
weather=$(wttrbar --hide-conditions --lang es --location "San Pedro de la Paz")
text=$(echo "$weather" | jq -r '.text')
transform=$(convert_emoji "$text")
res=$(echo "$weather" | jq --arg a "${transform}" '.text = $a')
echo "$res"
