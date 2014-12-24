#!/bin/bash
# Prerequisites: PHP (bundled with Mac OSX and CLI enabled by default)
# Dependencies:
# schema_rnc.php
# Generate RNC to a specified location using the local MYNG ENGINE
# First parameter is the myng code (without "myng-" prefix)
# Second parameter is the output file
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/
MYNG_BACK_END=${RNC_HOME}schema_rnc.php
PHP_CLI_INI=${RNC_HOME}php-cli.ini

# $1 ="b1-d7-a2-..."
# echo "$1"
newseparator=" "
spacecode="${1//-/$newseparator}"
#echo $spacecode
components=( $spacecode )
b=backbone=x${components[0]:1}
d=default=x${components[1]:1}
a=termseq=x${components[2]:1}
l=lng=x${components[3]:1}
p=propo=x${components[4]:1}
i=implies=x${components[5]:1}
t=terms=x${components[6]:1}
q=quant=x${components[7]:1}
e=expr=x${components[8]:1}
s=serial=x${components[9]:1}
query="$b $d $a $l $p $i $t $q $e $s"
echo "$query"
php -f "${MYNG_BACK_END}" -c "${PHP_CLI_INI}" ${query} > "$2"
if [ "$?" -ne "0" ]; then
     echo "Download Failed for myng-code " "$1"
     exit 1
fi
