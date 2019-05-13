#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Runs the production MYNG Engine on the RuleML server
# Passes the first input parameter to the MYNG engine, which generates a driver RNC schema.
# The driver schema is save at the location specified by the second input parameter.

url="http://deliberation.ruleml.org/1.03-psoa/myng-${1}.rnc"
echo "${url}"
#   Download from the MYNG REST interface to the output file using curl
curl -L "${url}" > "$2"
