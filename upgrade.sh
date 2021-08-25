#!/bin/bash
cd ./WSConfig/Servers
ls
echo World Name: && read name
cd $name
echo Would you like to upgrade your minecraft version? y/n: && read upgrade
if [ $upgrade = "n" ]
then
    if [[ -f version.wilver ]]
    then
        version=`cat version.wilver`
    else
        ls *.jar
        echo Minecraft Version: && read version
        echo $version >> version.wilver
    fi
    rm $version.jar
    echo $version
    cd ..
    cd ..
    if [[ -d BuildTools ]]
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
else
    echo What Minecraft version would you like to install? && read upgrade
    cd ..
    cd ..
    if [[ -d BuildTools ]]
    then
        echo BuildTools exists.
    else
        mkdir BuildTools
        echo BuildTools Error. Contact William.
        read -n 1 -s -r -p "Press any key to continue"
    fi
    cd BuildTools
    curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    java -jar BuildTools.jar --rev $upgrade
    cd ..
    cp "./BuildTools/spigot-$upgrade.jar" "./Servers/$name/$upgrade.jar"
    cd "./Servers/$name"
    rm version.wilver
    echo $upgrade >> version.wilver
    java -jar -Xmx4096m $upgrade.jar
fi
echo done