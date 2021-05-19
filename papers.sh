#!/bin/bash

OPTIONS="copy citation;copy key;copy DOI"
MENU=$(echo ${OPTIONS[@]} | sed 's/;/\n/g' | wofi --show=dmenu --insensitive)

if [ "$MENU" == "copy citation" ]
then

    PUB=$(pubs list | wofi --show=dmenu --insensitive)
    CITATION=$(echo $PUB | cut -d "]" -f 2)
    echo $CITATION | wl-copy
    exit
elif [ "$MENU" == "copy key" ]
then
    PUB=$(pubs list | wofi --show=dmenu --insensitive)
    KEY=$(echo $PUB | grep -oP '\[\K[^][]*(?=])' | head -1 )
    echo $KEY
    echo $KEY | wl-copy
    exit
fi


