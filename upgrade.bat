@echo off
title Enter World Name - William's Server Upgrader
cd WSConfig\Servers
dir
set /p name=World Name: 
cd %name%
set /p upgrade=Would you like to upgarde your minecraft version? (y/n): 
if %upgrade%==n (
    if exist version.wilver (
        set /p version=<version.wilver
    ) else (
        ::Show list of java files in the world file
        dir *.jar
        title Enter Minecraft Version - William's Server Starter
        ::Ask user for minecraft version
        set /p version=Minecraft Version: 
        ::Add the appropriate wilver file to the world folder 
        >version.wilver echo %version%
    )
    del %version%.jar
    title Downloading BuildTools - William's Server Starter 
    cd ..
    cd ..
    IF NOT EXIST BuildTools (
        mkdir BuildTools
        echo BuildTools Error. Contact William.
    )
    cd BuildTools
    @echo on
    curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    title Building %version% with BuildTools - William's Server Starter 
    java -jar BuildTools.jar --rev %version%
    cd ..
    copy "BuildTools\spigot-%version%.jar" "Servers\%name%\%version%.jar"
    cd "Servers\%name%"
    title %version% Server - William's Server Upgrader
    java -jar -Xmx4096m %version%.jar
) else (
    set /p upgrade=What Minecraft version would you like to install? 
    title Downloading BuildTools - William's Server Starter 
    cd ..
    cd ..
    IF NOT EXIST BuildTools (
        mkdir BuildTools
        echo BuildTools Error. Contact William.
    )
    cd BuildTools
    @echo on
    curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    title Building %upgrade% with BuildTools - William's Server Starter 
    java -jar BuildTools.jar --rev %upgrade%
    cd ..
    copy "BuildTools\spigot-%upgrade%.jar" "Servers\%name%\%upgrade%.jar"
    cd "Servers\%name%"
    del version.wilver
    >version.wilver echo %upgrade%
    title %upgrade% Server - William's Server Upgrader
    java -jar -Xmx4096m %upgrade%.jar
)
pause