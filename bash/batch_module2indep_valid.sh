#!/bin/bash

shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

echo "Generate independently valid rnc in order to validate each module individually"
echo ""

# removes all files from the indep_valid directory
mkdir -p "${INDEP_VALID_HOME}"
rm "${INDEP_VALID_HOME}"*.rnc >> /dev/null 2>&1


# This for loop runs over the rnc files in the relaxng/modules directory
for file in "${MODULE_HOME}"*.rnc
do
  # create a file of the same name in the indep_valid directory
  # Add the necessary two lines of text to that file, according to the name of the module (one "echo" command for each line)
  filename="$(basename ${file} .rnc)"
  echo "file : ${filename}"
  if [[ "${filename}" != "init_expansion_module" ]]; then
    echo "include \"../modules/${filename}.rnc\"" >> "${INDEP_VALID_HOME}${filename}.rnc"   
  fi
  echo "include \"../modules/init_expansion_module.rnc\"" >> "${INDEP_VALID_HOME}${filename}.rnc" 
  if [[ "$?" -ne "0" ]]; then
     echo "Indep Valid Module Generation Failed"
     exit 1
  fi
done