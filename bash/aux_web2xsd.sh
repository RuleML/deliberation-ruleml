#!/bin/bash
# Auto-generate XSD from MYNG REST interface URL
# Can be used in batch mode or standalone.
# Prerequisites:
#  Installation of curl
#  See also rnc2xsd for additional dependencies.
# Instructions: 
#    The first argument should be a MYNG REST interface URL. 
#      For batch execution, the RNC modules should be locally available, and 
#      the value for the query parameter "serial" should be either "x10" (for normal and "plus" languages) or "x22".
#      For standalone execution, the value for the query parameter "serial" should be either "x30" (for normal and "plus" languages) or "x32".
#      This selection disables explicit datatyping and schemaLocation in the RNC schema,
#      as those are implemented by default in XSD. 
#      Also, these values include the pivot ("1") and absolute ("3") bits , which are not directly available from the MYNG GUI.
#    The second argument should be the path, including filename, where the output is to be written. This file should not exist.
# Example: 
# source aux_web2xsd.sh "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x6&terms=xf0f&quant=x1&expr=x0&serial=x30" "../xsd/bindatagroundfact_normal.xsd"
#
# TODO
#   Take myng-code input instead of the full REST URL.
#   Include arguments for batch or standalone options.
#   Add the XSLT post-processing.
#
#   If the relaxng directory does not exist, create it.
mkdir -p ../relaxng
#   Download from the MYNG REST interface into the ../relaxng directory
curl -l $1 > ../relaxng/tmp-web2xsd.rnc
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc $2
