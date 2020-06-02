#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]

# Builds using local instance of MYNG

# shopt -s: Print a list of all options that are currently set. Its a shell optional behavior.
# nullglob: If set, bash allows filename patterns which match no files to expand to a null string, rather than themselves
shopt -s nullglob

# Execute path_config.sh, found in the BASH_HOME directory.
# BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;    # Go to directory of script and get its path with pwd command, put path into BASH_HOME variable.
                                                     ## The dirname command returns directory name part of a filename.
													 ## $0 returns the current file name.
													 ## pwd -P displays the physical directory, without any symbolic links.
													 ## An extra '/' is required.
# . "${BASH_HOME}path_config.sh";   # Read and execute (denoted by '.'), commands from path_config script found in BASH_HOME directory.
                                    ## All global variables regarding directory locations are declared and described in script path_config.sh .
                                    ## On the left side, variable BASH_HOME is '='-defined, while on the right side, it is redefined by path_config.sh .	
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;    . "${BASH_HOME}path_config.sh";

# Test RNC locally
# ${BASH_HOME}build_myng2rnc.sh  # Invoke build_myng2rnc script.
# if [[ "$?" -ne "0" ]]; then    # Check if exit status of build_myng2rnc script is failure (non-zero).
                                 ## 'if' tests whether exit status of [[ ... ]]-list of commands is 0 (0 indicates success, non-zero indicates failure) and 'then' executes one or more commands.
                                 ## Bash considers [[ "$foo" -ne "$bar" ]] as a single element, returning an exit status.
								 ## Make use of Bash's [[ ... ]] test command, which is the more versatile than [ ... ]:
								 ## Using the [[ ... ]] test construct, rather than [ ... ] can prevent many logic errors in scripts.
								 ## ('[[' is a keyword, not a command.)
                                 ## "$?" is exit status of the script build_myng2rnc.
								 ## Not equal is denoted as -ne .
# echo "Local Testing of RNC Schemas Failed"    # Display failure message when exit status of the script build_myng2rnc is non-zero.
# exit 1    # Catch-all for general errors and miscellaneous errors.
# fi        # End of 'if' condition in Bash

"${BASH_HOME}build_myng2rnc.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of RNC Schemas Failed"
     exit 1
fi

# Build XSD locally and test

# ${BASH_HOME}build_myng2xsd.sh                 # Invoke build_myng2xsd script.
# if [[ "$?" -ne "0" ]]; then                   # Check whether exit status of build_myng2xsd script is non-zero.
# echo "Local Testing of XSD Schemas Failed"    # Display failure message when exit status of build_myng2xsd.sh is non-zero.

"${BASH_HOME}build_myng2xsd.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSD Schemas Failed"
     exit 1
fi

# Test Normalizer

# ${BASH_HOME}batch_xslt_test-normal.sh             # Invoke batch_xslt_test-normal script.
# if [[ "$?" -ne "0" ]]; then                       # Check whether exit status of batch_xslt_test-normal script is non-zero.
# echo "Local Testing of XSLT Normalizer Failed"    # Display failure message when exit status of batch_xslt_test-normal.sh is non-zero.

"${BASH_HOME}batch_xslt_test-normal.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSLT Normalizer Failed"
     exit 1
fi

# Test Compactifier

# ${BASH_HOME}batch_xslt_test-compact.sh              # Invoke batch_xslt_test-compact script.
# if [[ "$?" -ne "0" ]]; then                         # Check whether exit status of batch_xslt_test-compact script is non-zero.
# echo "Local Testing of XSLT Compactifier Failed"    # Display failure message when exit status of batch_xslt_test-compact.sh is non-zero.

"${BASH_HOME}batch_xslt_test-compact.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Local Testing of XSLT Compactifier Failed"
     exit 1
fi

# Build zip files

# ${BASH_HOME}build_zip.sh            # Invoke build_zip script (zips all files from relaxng/module folder into RNCModulesDeliberation1.03-psoa.zip)
# if [[ "$?" -ne "0" ]]; then         # Check whether exit status of build_zip script is non-zero.
# echo "Build of zip files Failed"    # Display failure message when exit status of build_zip.sh is non-zero.

"${BASH_HOME}build_zip.sh"
if [[ "$?" -ne "0" ]]; then
     echo "Build of zip files Failed"
     exit 1
fi
