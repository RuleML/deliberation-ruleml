#!/bin/bash
# Download RNC and convert to RNG
source batch_rnc2rng.sh
# Validate against Design Pattern
# @@@
# Download RNC for Testing
source batch_web2rnc.sh
# Validate Examples in Relax NG Test Suites
# @@@
# Download RNC and convert to XSD
source batch_web2xsd.sh
# Apply XSLT transforamtions
# @@@
# Validate Examples XSD Test Suites
# @@@
# If everything validates, then build the documentation
#source batch_xsd2doc
.sh