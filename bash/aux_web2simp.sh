#!/bin/bash
# Auto-generate Simplified RNC from MYNG REST interface URL
# Can be called from batch mode (see batch_web2simp.sh) or used standalone.
# Prerequisites:
#  Installation of curl
#  See also rnc2simp for additional dependencies.
# Instructions: 
#    The first argument should be the suffix of a myng-code. 
#      For batch execution, the RNC modules should be locally available, and 
#      the value for the query parameter "serial" should be either "x8" (for normal languages) or "xf".
#      For standalone execution, the value for the query parameter "serial" should be either "x38" (for normal) or "x3b".
#      This selection disables explicit datatyping in the RNC schema,
#      as this is not handled correctly by Jing simplification. 
#      Also, the standalone values include the absolute ("3") bits , which are not directly available from the MYNG GUI,
#      so there is no need to have the modules locally available.
#    The second argument should be the path, including filename with .rnc extension, where the output is to be written. This file should not exist.
# Example: 
# source aux_web2simp.sh "b1-d6-a2-l1-p3cf-i6-tf0f-q1-e0-s38" "../xsd/bindatagroundfact_normal.rnc"
#
# TODO
#
#   If the relaxng directory does not exist, create it.
mkdir -p ../relaxng
#   Download from the MYNG REST interface into the ../relaxng directory
curl -L "http://deliberation.ruleml.org/1.01/myng-$1.rnc" > ../relaxng/tmp-web2simp.rnc
# perform the simplication and conert back to RNC
./rnc2simp.sh ../relaxng/tmp-web2simp.rnc $2
# remove the temporary file
rm ../relaxng/tmp-web2simp.rnc
