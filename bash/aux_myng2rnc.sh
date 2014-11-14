#!/bin/bash
# Download RNC to a specified location using the myng-code
# First parameter is the myng code (without "myng-" prefix)
# Second parameter is the output file
# Prerequisites:
# Installation of curl
# Depends on the server redirect of myng-code URL to the MYNG REST engine

url="http://deliberation.ruleml.org/1.02/myng-${1}.rnc"
echo "${url}"
#   Download from the MYNG REST interface to the output file
curl -L "${url}" > $2
