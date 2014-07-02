#!/bin/bash

# Auto-generate Schema Docs from XSD


# http://deliberation.ruleml.org/1.01/xsd/datalogplus_min_normal.xsd
/Applications/oxygen/schemaDocumentationMac.sh  ../xsd/datalogplus_min_normal.xsd  -cfg:settings/doc.xml
 
# http://deliberation.ruleml.org/1.01/xsd/disdatalogplus_mid_normal.xsd
/Applications/oxygen/schemaDocumentationMac.sh  ../xsd/disdatalogplus_mid_normal.xsd  -cfg:settings/doc.xml


# http://deliberation.ruleml.org/1.01/xsd/naffologeq_normal.xsd
/Applications/oxygen/schemaDocumentationMac.sh  ../xsd/naffologeq_normal.xsd  -cfg:settings/doc.xml
