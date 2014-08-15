#!/bin/bash
# Prerequisites:
#   Installation of Java and Jing/Trang. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar

# convert all MYNG modules to RNG in preparation
# for validation against the schema for the design pattern
cd ../relaxng/modules/
rm ../tmp/modules/*
rmdir ../tmp/modules
mkdir ../tmp/modules
for file in *.rnc 
do 
  java -jar "${CP2}"  "${file}" "../tmp/modules/${file}.rng"
done
# Validate against ../designPattern/include_expansion_schema.rng
#cd ../tmp/modules/
#for file in *.rng
#do
#  java -jar "${CP1}" "../designPattern/include_expansion_schema.rng"  "${file}"
#done
cd ../../bash