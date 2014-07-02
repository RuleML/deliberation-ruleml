#!/bin/bash
# Auto-generate XSD from MYNG REST interface URL
# Prerequisites:
#  Installation of curl
#  A local copy of the modules directory in the sibling /relaxng directory, as in the complete git repo.
#  See also rnc2xsd for additional dependencies.
# Instructions: 
#    The first argument should be a MYNG REST interface URL. The value for the query parameter "serial" should be either "x10" (for normal and "plus" languages) or "x12".
#      This selection disables explicit datatyping and schemaLocation in the RNC schema,
#      as those are implemented by default in XSD. 
#      Also, it includes the pivot bit (the "1"), which is not directly available from the MYNG GUI.
#    The second argument should be the path, including filename, where the output is to be written. This file should not exist.
# Example: 
# source aux_web2xsd.sh "http://deliberation.ruleml.org/1.01/relaxng/schema_rnc.php?backbone=x1&default=x6&termseq=x2&lng=x1&propo=x3cf&implies=x6&terms=xf0f&quant=x1&expr=x0&serial=x10" "../xsd/bindatagroundfact_normal.xsd"
#
# TODO
# 1.  Add a conditional testing if the relaxng directory already exists, and if it contains the module directory.
#   If the relaxng directory does not exist, create it.
#   If the relaxng directory does not contain the modules directory, download it;
#      OR modify the MYNG REST interface to provide a standalone driver that includes the online modules. 
# 2. Add the XSLT post-processing.
curl -l $1 > ../relaxng/tmp-web2xsd.rnc
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc $2
