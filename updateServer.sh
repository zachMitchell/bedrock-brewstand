#!/bin/bash
#Checks minecraft.net to see if there's a new version of the server. If there is, begin an installation
#WARNING!!! This isn't designed to merge two existing installs together right now, just a fresh install from mojang's website. You can try to merge, but keep in mind some things will be overwritten from your old files if something exists in the zip (like server.properties)

updateLink=$(wget "https://www.minecraft.net/en-us/download/server/bedrock/" -O - | grep serverBedrockLinux | python3 ./python/updateServer.py)
existingInstall=0
downloadNewData=1
folderDiffChecks=("resource_packs" "behavior_packs" "worlds") #Add items here if there is anything else you want added back to the finished installation.
fileReplace=("server.properties" "permissions.json" "whitelist.json") #files in the root directory.
if [ $updateLink = 'noupdate' ]; then echo "Looks like you have the latest version :)";
else
    echo "A new version of the bedrock server is available! Would you like to install it from $updateLink ? (y/N)";
    read -s -n 1 response;
    if [ -n $response ] && [ $response = 'y' ]; then
        echo 'Sounds good! The download is about to begin. If you have an existing install, the important parts will be kept safe while the new version is extracted.\n';

        #If the download data exists, ask about extracting it:
        if [ -e downloadData.zip ]; then
            echo "So I just found some download data already, would you like to use this instead of downloading a new one? (Please make sure the file isn't corrupted) (y/N)";
            read -s -n 1 response;
            if [ -n $response ] && [ $response = 'y' ]; then downloadNewData=0; fi

            #If the file doesn't exist, download:
            else downloadNewData=1;
        fi

        if [ $downloadNewData = 1 ]; then wget $updateLink -O ./downloadData.zip; echo "Download complete!";fi

        if [ -e downloadData.zip ]; then
            echo "Extracting files...";
            if [ -d bedrock ] && [ ! -d bedrock.bak ]; then
                existingInstall=1
                mv bedrock bedrock.bak
            fi
            
            mkdir bedrock
            unzip ./downloadData.zip -d bedrock;

            if [ -d bedrock.bak ]; then
                echo "Moving old installation files to the new one...";
                # Paste previous installation's files
                for file in ${fileReplace[*]}; do
                    if [ -e bedrock.bak/$file ]; then
                        echo "$file"; mv "bedrock.bak/$file" "bedrock/$file";
                    fi
                done

                #Paste old directories' info (It's possible old resource/behavior packs made by mojang can sneak in)
                for folder in ${folderDiffChecks[*]}; do
                    if [ ! -d "bedrock/$folder" ]; then mkdir bedrock/$folder; fi;

                    echo -- $folder --;
                    for item in bedrock.bak/$folder/*; do
                        fixedItem=${item##*/};
                        if [ ! -e "bedrock/$folder/$fixedItem" ] && [ -e "bedrock.bak/$folder/$fixedItem" ]; then
                            echo $folder/$fixedItem;
                            mv "bedrock.bak/$folder/$fixedItem" "bedrock/$folder/$fixedItem";
                        fi
                    done
                done

                echo "Transfer complete, removing extra files from the root of bedrock.bak";
                for i in "bedrock_server","bedrock_server_how_to.html", "bedrock_server_realms.debug", "libCrypto.so"; do rm bedrock.bak/$i;done

            fi
            #If we downloaded new data, set the version:
            if [ $downloadNewData ]; then echo $(python3 python/versionFromUrl.py "$updateLink") > bedrockVersion.txt;fi;

            echo "Cleaning up install download..."
            rm downloadData.zip;

            echo "Installation complete.";
            if [ $downloadData ]; then echo 'Anything not moved over has been saved in "bedrock.bak". Please take a look and make sure you have everything before deleting that folder.'; fi
            else echo "Hmm... looks like there was an error downloading, sorry about that";
        fi

        else echo "abort"
    fi
fi
