#!/bin/bash
# Convert RNC to RNG using Jing
# Prerequisites:
#   Installation of Java and Jing/Trang. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=~/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar

# Finds the filename without extension
filename=$(basename "$1")
extension="${filename##*.}"
filenameNE="${filename%.*}"

# Verifies that input file name ends in ".rnc"
if [ "${extension}" != "rnc" ];then
   echo "Extenstion is not .rnc"
   exit 1
fi

# Runs Trang on the input and generates RNG
java -jar "${CP2}"  $1 "${2}/${filenameNE}.rng"
