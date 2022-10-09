#!/bin/bash

if [ "$1" == "build" ]
then
    winpty docker build -t discord-music .
elif [ "$1" == "run" ]
then
    winpty docker run -d --name discord-music --restart=always discord-music
else
    echo "To build the docker image: "
    echo "./discord-music.sh build"
    echo "To run the docker container: "
    echo "./discord-music.sh run"
fi
