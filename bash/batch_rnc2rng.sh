#!/bin/bash
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar

# convert all MYNG modules to RNG in preparation
# for validation against the schema for the design pattern
cd ../relaxng/modules/
for file in *.rnc 
do 
  java -jar "${CP2}"  "${file}" "../tmp/modules/${file}.rng"
done
cd ../../bash