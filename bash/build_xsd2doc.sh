#!/bin/bash

# Auto-generate Schema Docs from XSD

shopt -s nullglob
BASH_HOME=~/Repositories/RuleML/Github/deliberation-ruleml/bash
XSD_HOME=${BASH_HOME}/../xsd 
OXY_HOME=/Applications/oxygen
DOC_HOME=${OXY_HOME}/schemaDocumentationMac.sh

# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
${DOC_HOME}  ${XSD_HOME}/datalogplus_min_normal.xsd  -cfg:${BASH_HOME}/settings/doc.xml
 
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
${DOC_HOME}  ${XSD_HOME}/disdatalogplus_mid_normal.xsd  -cfg:${BASH_HOME}/settings/doc.xml


# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
${DOC_HOME}  ${XSD_HOME}/naffologeq_normal.xsd  -cfg:${BASH_HOME}/settings/doc.xml
