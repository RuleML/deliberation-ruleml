#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# No input parameters required.
# Validate the datalogPSOA XSD schema with JAXB
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";
mkdir -p "${TMPDIR}"
filenameNE="datalogPSOA_normal"
fxsd="${XSD_HOME}${filenameNE}.xsd"
"${BASH_HOME}aux_valxsd.sh" "${fxsd}"
#java -jar "${JAXB_HOME}lib/jaxb-xjc.jar" -b "${XSD_HOME}datalogPSOA.xjb" "${fxsd}" -disableXmlSecurity -d "${TMPDIR}"