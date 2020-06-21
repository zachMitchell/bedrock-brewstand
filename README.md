# bedrock-brewstand
Bedrock Brewstand is a collection of powerful tools to help you maximize your usage of Mojang's official Linux server software for [Minecraft Bedrock edition](https://www.minecraft.net/en-us/download/server/bedrock/).

**This project is a work in progress!** Keep in mind things are not perfect and can possibly break. If you run into anything annoying, submit something in the issues section.

## Background

In the past (as well as today's present), Bedrock has lacked vast official support for server software. Right now, it's known that many folks Mojang has decided to partner with have even been using homebrew solutions to accomodate for said issue. In other words, most servers you see in the "servers" section of the minecraft game selection are custom.

As of recently, Mojang has finally started to build some server software, which features everything from Mob suppport to modern structures like villager housing. Resource and behavior packs are available as well, which homebrew solutions might struggle with.

Even with the impressive support on Mojang's end; this software isn't perfect: 

* you cannot run this in the backround, which means a terminal must be alive at all times for the server to run.
* There is no way to have more than one world running at once without building at least a 1gb copy of the existing server.
* lack of any sortof package management. (for installing/updating)

For **Bedrock Brewstand**, all the listed problems above are solved, and more to come!

## Features

* **Update manager** - Install or Migrate an existing server to the lastest verison with ease! Brewstand checks the download website and prompts for a download if it's greater than what you have. When installed, all your worlds and configuration files are right where you left them.
* **Server instances** - create multiple servers that are only 4 kilobytes in size! Each instance is based on properties of a "host" server, with special files like `server.properties` making a copy instead. These "pseudo" servers per-say can all be run at the same time and can even share resources like resource and behavior packs.

### Planned features

* **Run servers in the background** - already have proof of concept code for this, just needs to be implemented for the project. This makes use of `screen` to launch servers in their own environment that you can hop in and out of.
* **Automate Commands** - Let your servers touch the outside world! By using pipes you can configure the server to launch commands based on anything thrown at stdin. Some examples include showing twitter posts or teleporting everyone to one spot on the map depending on what time it is.

## System requirements f

This project does **not** support the windows server or Mojang's windows build. Bedrock Brewstand makes extensive use of Linux features which do not directly exist on windows. To run this on windows, you will need [WSL](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux).

That being said, it's not impossible to port this over natively, and might work given the right pieces on windows. The focus on this codebase will primarily be for linux however.

* **OS** - Ubuntu-based Linux distribution (Ubuntu, Lubuntu, Mint, Xubuntu, etc)
* Python V3 +
* wget
* screen (in the future)
