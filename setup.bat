@echo off
title Enter Information - William's Server Configurator 
::set stuff
set /p name=World Name: 
set /p from=World Folder: 
set /p version=Minecraft Version: 
::copy world file
title Copying World - William's Server Configurator 
IF NOT EXIST WSConfig (
    mkdir WSConfig
    echo There may be a problem, please contact William.
    pause
)
cd WSConfig
IF NOT EXIST BuildTools (
    mkdir BuildTools
)
cd BuildTools
IF NOT EXIST template (
    mkdir template
    echo Please tell William that there is no template Folder
    pause
)
cd ..
if not exist Servers (
    mkdir Servers
)
cd Servers
mkdir "%name%"
cd %name%
xcopy /s %from% world\
::download server file
title Downloading BuildTools - William's Server Configurator 
cd ..
cd ..
cd BuildTools
@echo on
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
title Building %version% with BuildTools - William's Server Configurator 
java -jar BuildTools.jar --rev %version%
::copy needed files
title Copying Needed Files - William's Server Configurator 
cd ..
copy "BuildTools\spigot-%version%.jar" "Servers\%name%\%version%.jar"
copy "BuildTools\template\eula.txt" "Servers\%name%\eula.txt"
copy "BuildTools\template\server.properties" "Servers\%name%\server.properties"
::try run server
title %version% Minecraft Server - William's Server Configurator 
cd "Servers\%name%"
>version.wilver echo %version%
java -jar -Xmx4096m %version%.jar
pause