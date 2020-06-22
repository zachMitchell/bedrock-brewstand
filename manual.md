# Commands instruction manual

Bedrock Brewstand comes with a good portion of commands. If you were to look at most of them, they are very small and easy to understand if your used to reading code. The reason for their size is because they make use of what's already built-in to Linux from the get-go, therefore not everything needs to be re-built from scratch to do things like downloading updates and installing them from the internet. We call these **Bash Scripts**, and this manual will teach you how to use each one.

Keep note that each command is designed to be run within the root folder, in other words the very folder that's holding this code. Running these scripts in another folder might cause problems.

## updateServer.sh

This command installs the latest version of bedrock in the same folder bewstand is in. If your installing for the first time, there isn't really anything to worry about other than running the command. If for some reason any part of the installation goes wrong, sometimes a file known as `bedrockVersion.txt` is built pre-maturely, so to re-download the software again just delete this file.

What if you have an existing server? You can also run this as normal and important files like resource/behavior packs and worlds are kept when the install is done. Sometimes things go wrong or you need something specific done, and that's what the next section is all about.

### Incomplete download

If the download breaks, it's possible your bedrock folder will stay as bedrock.bak after a series of errors. Your files are ok! Just rename the folder back to bedrock and you should be back on your feet again.

### Broken install

If for some reason your stuck with both bedrock *and* bedrock.bak after a failed install, you may have to dig a little bit to move things back... Typically files are moved from bedrock.bak *to* bedcrock after file extraction, so take a peek and see what's already over on the bedrock file and move those items over to bedrock.bak. Check `updateServer.sh` and look at the variables `folderDiffChecks` and `fileReplace`. These are the files and folders that are moved over for each install, so you can use that as a reference for what to look for. After moving things back, just try the install again.

### Advanced install setups

Sometimes you want to bring over more than just the default items. At the end of an install from a previous version, you have a folder called `bedrock.bak` that has your old stuff. You can use this to get stuff not listed, but then again... why *not* have them listed?

To add items not part of a normal install, you can go inside `updateServer.sh` and check out the variables `folderDiffChecks` and `fileReplace`. The first one is a list of folders that will be transferred during an install. The second is a list of files in the root directory that will be transferred (you can also speficy specific files as well, just specify the path starting at the bedrock folder). Simply add the stuff you want to each respective list and you should be golden!

Note that this file could periodically be updated, so save your changes elsewhere as well if you plan on updating Brewstand itself.

## launch.sh

Your primary command to launch bedrock. When this is run, a `screen` instance is created with the name of your server. If it's the main server it will be called `bedrock.core`. This command also takes arguments, each is the name of a server instance (See [Here](#newInstance.sh) for more info). If you wish to run multiples at once, just place more than one argument. If you want to run the main server with other instances, use `-core` as the argument

### Screen crash course

So what's screen?! Screen is an awesome tool that allows you to have terminals around without having one up on your physical display. The terminals themselves are very portable; so much that if you had the terminal on your computer monitor, you could instantly move over to your laptop and have the same instance over there. Screen is good for times when your internet might be spotty but your *really* don't want your command line programs to stop or crash. Overall it's a nice tool! This quick tutorial should help you get started quickly:

* To make your own terminal, run `screen`. you can add `-S myEpicName` to give your terminal a name. Let your terminal run in the background by also adding `-d -m`. For Brew stand you won't need this, but it's here in case you wish to use it for other purposes :)
* To list your terminals, run `screen -ls`. Brewstand will name your server terminals like this: `bedrock.core` or `bedrock.myServerName`
* To go inside your terminal while it's running, run `screen -r`. If you have multiple terminals, just add the name of the terminal you wish to enter. (e.g `screen -r bedrock.core`)
* To get out of your screen terminal and hide it, type in this shortcut: CTRL + A + D
* To brutally destroy your screen terminal and take it to the guillotine: CTRL + A + K (CTRL + C also works, which just closes the program, in our case the bedrock server)

That should do it! To learn more about screen, check out it's man page [Or just go here](https://linux.die.net/man/1/screen)

## screenBedrock.sh

This is the command that launch.sh uses, no need to really worry about it. However, if you wish to use this instead of launch.sh, it will launch the server granted you provide the path for it. This also ...despite my naming choices will just run the server on the current terminal instance, *not* screen. In other words it's the raw command that mojang has on their website XP

## newInstance.sh

Create new virtual servers! Imagine these being their own server, properties and all... BUT your core installation is where they get all their logic from! Virtual servers share everything except for permissions.json, whitelist.json and server.properties which gives you the flexiblity to do allot of things! This is all possible by the power of [Symbolic links](https://en.wikipedia.org/wiki/Symbolic_link), which are sortof like windows shortcuts but way cooler ;P

*To use this command* just type it in and the name of your instance. Multiple names can be put in to make more than one instance. Keep in mind that in order to make names with spaces, the name will need "to be wrapped around quotes like this"

# fin

Right now that's all there is to know about Bedrock Brewstand. To learn more about managing a minecraft server, a good place to start is the html file that comes with Mojang's software. You can also checkout the [Minecraft Wiki](https://minecraft.gamepedia.com/Server), they do an excellent job at describing the things these servers can do.
