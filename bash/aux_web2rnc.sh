#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Tests the production MYNG Engine on the RuleML server
# Depends on the server redirect of myng-code URL to the MYNG REST engine
# Dependencies: 
# curl
# webserver installation
# Downloads RNC to a specified location using the myng-code
# First parameter is the myng code (without "myng-" prefix)
# Second parameter is the output file
# Prerequisites:
# Installation of curl
# FIXME use configuration script to set base URL
url="http://deliberation.ruleml.org/1.02/myng-${1}.rnc"
echo "${url}"
#   Download from the MYNG REST interface to the output file
curl -L "${url}" > "$2"
