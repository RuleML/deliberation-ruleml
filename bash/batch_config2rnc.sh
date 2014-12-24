#!/bin/bash
# Dependencies: 
# aux_myng2rnc.sh
# config_rnc.txt
# config_rnc_myng.txt
shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
RNC_HOME=${REPO_HOME}relaxng/
TEST_HOME=${REPO_HOME}relaxng/test/

# creates the output directories if they don't exist, and clears them of RNC files, in case they already have contents
mkdir -p "${TEST_HOME}"
rm ${TEST_HOME}*.rnc
rm ${RNC_HOME}/.htaccess
    echo  "IndexIgnore .htaccess */.??* *~ *# */HEADER* */README* all_ordered.rnc all_unordered.rnc local.prepend.php php-cli.ini phpinfo.php schema_rnc.php schema_rnc_test.php error_log">> ${RNC_HOME}/.htaccess

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[1]}" "${TEST_HOME}${tokens[0]}_normal.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[2]}" "${TEST_HOME}${tokens[0]}_relaxed.rnc" >> /dev/null 2>&1
echo  "Redirect /1.02/relaxng/${tokens[0]}_normal.rnc http://deliberation.ruleml.org/1.02/myng-${tokens[1]}.rnc">> ${RNC_HOME}/.htaccess
echo  "Redirect /1.02/relaxng/${tokens[0]}_relaxed.rnc http://deliberation.ruleml.org/1.02/myng-${tokens[2]}.rnc">> ${RNC_HOME}/.htaccess
done < ${BASH_HOME}config_rnc.txt
echo -n "Redirect /1.02/relaxng/schema.rnc http://deliberation.ruleml.org/1.02/myng-b3f-d7-a7-l1-p3ff-i7f-tf3f-q7-ef-sf.rnc">> ${RNC_HOME}/.htaccess

while read line
do
    echo "Text read from file - $line"
    tokens=( $line )
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[1]}" "${TEST_HOME}myng-${tokens[1]}.rnc" >> /dev/null 2>&1
    ${BASH_HOME}aux_myng2rnc.sh "${tokens[2]}" "${TEST_HOME}myng-${tokens[2]}.rnc"
done < ${BASH_HOME}config_rnc_myng.txt

for file in ${TEST_HOME}*.rnc
do
  ${BASH_HOME}aux_valrnc.sh "$file"
  if [ "$?" -ne "0" ]; then
     echo "Validation Failed for " "${file}"
     exit 1
   fi
done
