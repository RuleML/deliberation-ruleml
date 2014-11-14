#!/bin/bash
# Auto-generate Simplified RNC from RNC
#   - makes modular RNC monolothic
#   - removes intermediate named patterns
#   - simplified definitions
# Prerequisites:
#   Installation of Java and Jing/Trang. See https://code.google.com/p/jing-trang/
# Note: change the APP_HOME path according to your path to the Jing/Trang library
# Caution: Jing simplification cannot handle specified qualified names in content
APP_HOME=/Users/taraathan/Library/
LIB=${APP_HOME}Java/Extensions/
CP1=${LIB}jing-20091111/jing.jar
CP2=${LIB}trang-20091111/trang.jar
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
RNC_HOME=${BASH_HOME}/../relaxng
TMP=${RNC_HOME}/tmp-std2xsd.rng

java -jar "${CP1}" -cs $1 > ${TMP}
if [ "$?" != "0" ];then
   echo "Simplification Failed."
   exit 1
fi
java -jar "${CP2}" ${TMP} $2
if [ "$?" != "0" ];then
   echo "Conversion back to RNC Failed."
   exit 1
fi
function finish {
  rm -f ${TMP}
}
trap finish EXIT
  