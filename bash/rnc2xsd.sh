#!/bin/bash
# Prerequisites:
#   Installation of Java and Jing/Trang. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar

java -jar "${CP1}" -cs $1 > ../relaxng/tmp-std2xsd.rng
java -jar "${CP2}" -o disable-abstract-elements -o any-process-contents=lax ../relaxng/tmp-std2xsd.rng $2
rm ../relaxng/tmp-std2xsd.rng