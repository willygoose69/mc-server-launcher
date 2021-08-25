#!/bin/bash
cd "./WSConfig/Servers"
ls 
echo World Name: && read name
cd "$name"
if [[ -f "version.wilver" ]]
then
    version=`cat version.wilver`
else
    ls *.jar
    echo Minecraft Version: && read version
    $version >> version.wilver
fi
echo $version
if [[ -f "$version.jar" ]]
then
    java -jar -Xmx4096m $version.jar
else
    cd ..
    cd ..
    ls
    if [[ -d "BuildTools/" ]]
    then
        echo BuildTools exists
    else
        mkdir BuildTools
        echo BuildTools Error. Contact William.
        read -n 1 -s -r -p "Press any key to continue"
    fi
    cd BuildTools
    curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    java -jar BuildTools.jar --rev $version
    cd ..
    cp "./BuildTools/spigot-$version.jar" "./Servers/$name/$version.jar"
    cd "./Servers/$name"
    java -jar -Xmx4096m $version.jar
fi
echo done