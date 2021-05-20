#!/bin/bash

OPTIONS="copy citation;copy key;copy DOI;add new from DOI"
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
elif [ "$MENU" == "add new from DOI" ]
then
    DOI=$(wofi --show dmenu)
    ADD=$(pubs add -D "$DOI" )
    echo $ADD
    NOTIFY=$(echo $ADD | grep -oP '".*"' )
    echo $NOTIFY
    notify-send "Paper added to library"
    exit
fi




