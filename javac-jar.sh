#!/usr/bin/env bash

javac -d ./ "$1"
echo "Manifest-Version: 1.0" >> manifest.mf
echo "Main-Class: $2" >> manifest.mf
jar cfm "$3" manifest.mf *.class
rm *.class manifest.mf