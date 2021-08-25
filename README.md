# spigot-launcher
Simple Batch script to create and run Spigot servers.

### Table of Contents
| Section                         |                         Contents                                                  |
|---------------------------------|-----------------------------------------------------------------------------------|
| [Setup](#setup)                 | [First Time](#first)                                                              |
| [Normal Use](#normal)           | [New Server](#new), [Start Server](#start), [Upgrade Server](#upgrade)            |
| [Customisation](#customisation) | [Minecraft Settings](#motd), [Change Defaults](#defaults), [Other Settings](#ram) |
| [Debugging](#debugging)         | [setup](#setupd), [start](#startd), [upgrade](#upgraded)              |
## What you need
Note: Make sure you have read and accept the [EULA](https://account.mojang.com/documents/minecraft_eula)  
In order for Minecraft servers to work, please make sure you have port 25565 open on your router, and have the appropriate java version properly installed
(Java 16 is required for 1.17 or above; Java 8 is required for 1.16.5 and lower). You also should have git installed.
### Java Downloads:
Java 8: https://www.oracle.com/uk/java/technologies/javase/javase-jdk8-downloads.html  
Java 16: https://www.oracle.com/uk/java/technologies/javase-jdk16-downloads.html  
Please note: Java is in no way related to me and definitely not created by me. 

## <a name="setup"></a>Setup
To set any new server up, weather it is the first time or not is very simple with this server launcher.

### <a name="first"></a>First time
If this is your first time, make sure you have cloned the repo and have them all in the same folder.
The first time you open each of the batch files Windows SmartScreen may decide it is a virus. This is completely normal, just click on "More Info", then Run.
I promise this isn't a virus. 

If you are running this on a Mac or Linux machine, you need to make sure you have made these files executable. The command for this is `sudo chmod +x <file>`.

On Windows, the batch files can be opened with File Explorer, however on Unix systems, you may have to run the shell files from the terminal. (Sorry I am not too familiar with shell scripts yet)

#### Running this on Unix machines
1. Open a terminal window
2. Navigate to the folder in which WSConfig is located (you can use `cd` and drag the folder in) You must do this for it to work.
3. Run the script with `./<name>.sh`

## <a name="normal"></a>Normal use

### <a name="new"></a>Making a new server
(For further customisation, [see customisation](#customisation).)  
Open the `setup.bat` or `setup.sh` file and follow the prompts. If you would like to generate a new world, you may leave the `World Folder:` prompt blank.
You may encounter an error at this point, if so make sure you have the template folder in WSConfig > BuildTools. For more info, [see debugging](#debugging).
The batch file should now have a lot of flying text. This is BuildTools.
Depending on if you have downloaded and built the specified version or not in the past, this process may take up to 20 mins.

### <a name="start"></a>Starting server
To load a server which you have set up with this tool before, launch `start.bat` or `start.sh`. It should show you a list of all servers you have created.
After you enter the name of the one you want to launch, it should quickly start. If there is any error, (which is unlikely provided you haven't tampered
with the version.wilver or server file) it will guide you through the setup again. ([see debugging](#debugging))

### <a name="upgrade"></a>Upgrading versions
To upgrade the Minecraft version or Spigot version, use `upgrade.bat` or `upgrade.sh`. It will ask you weather you are intending on upgrading or not.
If you do not respond with `n`, it will assume you do and ask for the version you wish to upgrade to. If you encounter any error, it will either guide you through it
or you will have to look through [debugging](#debugging).

## <a name="customisation"></a>Customisation
This tool currently doesn't have too many customisation options, you will have to edit the files if you want to change anything

### <a name="motd"></a>Changing MOTD or other minecraft-related settings
All of the servers are stored in an appropriately named folder called `Servers` located in `WSConfig`. Minecraft-Related settings are generally in `servers.properties`.

### <a name="defaults"></a>Editing default server.properties file
The `server.properties` file is located in `template` in `WSConfig`. Please don't change the file names as it will break the setup batch file.

### <a name="ram"></a>RAM Usage and other settings
This may be changed in the future, but for the time being please find and replace `4096m` in all batch and sh files and replace it with the amount of ram you are willing
to give Java in megabytes, followed by 'm' (e.g. `2048m`)  
If there is anything else you would like to change, feel free to dive into the batch files. Pull Requests are welcome.

## <a name="debugging"></a>Debugging
### <a name="setupd"></a>setup
#### There may be a problem, please contact William.
This error means that the WSConfig file wasn't present. It would have created it for you by the time it shows the text, but it probably wouldn't have the template
files in it. Please make a folder in `WSConfig` and call it `template`. In that folder put in the EULA and server.properties files. They should be there if you properly
cloned the repo.  
After you have created the template folder and placed in the required files, press any key to continue and all should work fine.
#### Please tell William that there is no template Folder.
This means that there is no `template` folder in `WSConfig`. Please download it back from the repo or create your own. You need an EULA.txt and server.properties in the folder for the server to function.
### <a name="startd"></a>start
If there is any issue when running `start.bat` or `start.sh`, it should guide you through the necessary steps to fixing it. The BuildTools Error is only a warning,
it will fix itself.
### <a name="upgraded"></a>upgrade
#### BuildTools Error. Contact William.
This is a minor error and will be fixed by itself. The download and build of the Minecraft version may take longer due to the lost files.
#### You will be prompted if there is any other error.

## Thank You
Thanks for reading my README. Enjoy playing on your server.
