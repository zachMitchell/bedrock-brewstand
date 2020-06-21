# Made by Zachary Mitchell in 2020!
# Grab Mojang's bedrock server page and Check for the latest version. If the latest version is here, do nothing unless you really want to.
from stdin import stdin
import updateUtils

if __name__ == '__main__':
    # use stdin to get the link, where index one should be where the link is found <a href="link">
    servLink = stdin().split('"')[1]
    latestVersion = updateUtils.getVersionFromUrl(servLink)

    if updateUtils.needsUpdate(latestVersion):
        print(servLink)
    else:
         print('noupdate')