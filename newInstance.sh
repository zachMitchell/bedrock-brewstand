#!/bin/bash

# Create a new instance of the server. This virtually does not take up much of any space to do because of symoblic linking. The only things that are "copied" per-say are things that make sense to change like server.properties
thingsToCopy=('permissions.json' 'whitelist.json' 'server.properties')
filesToLink=('bedrock_server' 'bedrock_server_realms.debug' 'libCrypto.so' 'valid_known_packs.json')
#All folders are linked, so no list for that.

if [ -z $1 ]; then echo "This command lets you create a clone of your core installation without taking up as much space. To use it, insert a name for the instance before running the command (e.g $0 \"My new instance name\" myOtherInstance myThirdInstance)";

    else
        #Off to the races!!
        while [ ! -z $1 ]; do
            echo "Making $1...";
            if [ ! -d ./instances ]; then mkdir ./instances; fi
            if [ ! -d ./instances/$1 ]; then
                mkdir ./instances/$1;

                #directories:
                for i in bedrock/*; do
                    if [ -d $i ]; then ln -s ../../$i instances/$1/${i##*/};fi
                done

                #linked files:
                for i in ${filesToLink[*]}; do
                    if [ -e bedrock/$i ]; then ln -s ../../bedrock/$i instances/$1/$i;fi
                done

                #copied files:
                for i in ${thingsToCopy[*]}; do
                    if [ -e bedrock/$i ]; then cp bedrock/$i instances/$1/$i;fi
                done

                else echo "Error: this name was already taken :("
            fi
            shift;
        done
        echo "Done! The following are unique files to customize for your instances: ${thingsToCopy[*]}";
fi