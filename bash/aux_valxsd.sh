#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# With one input parameter, validate an XSD schema
# With two input parameters, validate an XML instance against the schema.
# If there is a third input parameter with value "1", validate the schema before attempting to validate the instance.
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${TMPDIR}"

# Finds the filename without extension
filename=$(basename "$1")
extension=${filename##*.}

# Verifies that input schema name ends in ".xsd"
if [[ "${extension}" != "xsd" ]];then
   echo "Extension $extension is not .xsd"
   exit 1
fi

# Validate schema against JAXB
# if the number of input arguments is one, or the schema validiation flag (third argument) is set
if [[ "$#" -eq 1 ]] || [[ -e "$3"  &&  "$3" -eq "1" ]]; then
  sleep 2
  # Skip validation of mixed serialization  
  if [[ ${filename} =~ normal ]] || [[ ${filename} =~ compact ]]; then
    echo "Validating  $1  with JAXB"
    java -jar "${JAXB_HOME}lib/jaxb-xjc.jar" "$1" -disableXmlSecurity -d "${TMPDIR}"
    if [[ "$?" -ne "0" ]]; then
      echo "Validation Failed for schema $1"
      exit 1
    fi
  fi    
fi
    
# Validate (using xmllint) the second argument as an instance, if the file exists  
if [[ -e "$2" ]]; then
  sleep 2
  echo "Validating $2 against $1 with xmllint"
  xmllint -noout --schema "$1" "$2"
  if [[ "$?" -ne "0" ]]; then
    echo "Validation Failed for instance $2"
    exit 1
  fi
fi
