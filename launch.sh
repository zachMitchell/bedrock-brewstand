#!/bin/bash
# This script actually goes to another due to technical limitations :P

function launch {
    path='';
    name='bedrock.';
    if [ $1 = '-core' ]; then
        path='bedrock';
        name=$name'core';
        else
            path="instances/$1";
            name=$name$1;
    fi
    #Launch away!
    screen -d -m -S $name ./screenBedrock.sh $path;
}

if [ -z $1 ]; then launch -core;
    else while [ ! -z $1 ]; do
        launch $1
        shift;
    done
fi