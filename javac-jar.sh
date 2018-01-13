#!/usr/bin/env bash

if javac -d ./ "$1" -J-Xms128m -J-Xmx256m; then
    echo "Manifest-Version: 1.0" >> manifest.mf
    echo "Main-Class: $2" >> manifest.mf
    jar cfm "$3" manifest.mf *.class -J-Xms128m -J-Xmx256m
    rm *.class manifest.mf
    exit 0
else
    exit 1
fi