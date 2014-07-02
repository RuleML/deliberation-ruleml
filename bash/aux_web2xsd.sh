#!/bin/bash
# Auto-generate XSD from MYNG REST interface URL
# Prerequisites:
#  Installation of curl
#  See also rnc2xsd for additional dependencies.
curl -l $1 > ../relaxng/tmp-web2xsd.rnc
./rnc2xsd.sh ../relaxng/tmp-web2xsd.rnc $2
