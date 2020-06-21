import os

def needsUpdate(version):
    #Check the version we have, if it's not there or the version is different, return true
    newVersionAvailable = False
    if 'bedrockVersion.txt' in os.listdir():
        localVersion = open('bedrockVersion.txt').readline().strip('\\n').split('.')
        versionArg = version.split('.')

        if len(localVersion) == 1 and localVersion[0] == '':
            newVersionAvailable = True
        else:
            for i in range(len(localVersion)):
                if int(localVersion[i]) < int(versionArg[i]):
                    newVersionAvailable = True
                    break
    else:
        newVersionAvailable = True

    return newVersionAvailable

getVersionFromUrl = lambda url : url.split("bedrock-server-")[1].strip('.zip')