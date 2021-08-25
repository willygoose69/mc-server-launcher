#!/bin/bash
#set stuff
echo World Name: && read name
echo World Folder: && read from
echo Minecraft Version: && read version
#copy world file
if [[ -d "WSConfig/" ]]
then
    echo You already have WSConfig
else
    mkdir WSConfig
    echo There may be a problem, please contact William.
    pause
fi 
cd WSConfig
if [[ -d "BuildTools/" ]]
then
    echo You already have BuildTools
else
    mkdir BuildTools
    BuildTools Error. Contact William.
    read -n 1 -s -r -p "Press any key to continue"
fi
cd BuildTools
if [[ -d "template/" ]]
then
    echo You already have template
else
    mkdir template
    echo Please tell William that there is no template Folder
    read -n 1 -s -r -p "Press any key to continue"
fi
cd ..
if [[ -d "Servers/" ]]
then
    echo You already have Servers
else
    mkdir Servers
fi
cd Servers
mkdir "$name"
cd "$name"
cp -r "$from" world/
#download server file
cd ..
cd ..
cd BuildTools
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev $version
#copy needed files
cd ..
cp "./BuildTools/spigot-$version.jar" "./Servers/$name/$version.jar"
cp "./BuildTools/template/eula.txt" "./Servers/$name/eula.txt"
cp "./BuildTools/template/server.properties" "./Servers/$name/server.properties"
#try run server
cd "./Servers/$name"
echo $version >> version.wilver
java -jar -Xmx4096m $version.jar
echo done