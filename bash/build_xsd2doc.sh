#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Auto-generate Schema Docs from XSD
# FIXME use configuration script to set path variables
# FIXME use a configuration text file to loop over doc creation

shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/
REPO_HOME="${BASH_HOME}../"
XSD_HOME=${REPO_HOME}xsd/
OXY_HOME=/Applications/oxygen/
DOC_HOME=${OXY_HOME}schemaDocumentationMac.sh

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
${DOC_HOME}  ${XSD_HOME}datalogplus_min_normal.xsd  -cfg:${BASH_HOME}settings/doc.xml
 
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
${DOC_HOME}  ${XSD_HOME}disdatalogplus_mid_normal.xsd  -cfg:${BASH_HOME}settings/doc.xml


# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
${DOC_HOME}  ${XSD_HOME}naffologeq_normal.xsd  -cfg:${BASH_HOME}settings/doc.xml