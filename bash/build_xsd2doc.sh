#!/bin/bash
# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
# Auto-generate Schema Docs from XSD

shopt -s nullglob
BASH_HOME=$( cd "$(dirname "$0")" ; pwd -P )/ ;. "${BASH_HOME}path_config.sh";

mkdir -p "${REPO_HOME}doc/"
anchor="datalogplus_min_normal"
mkdir -p "${REPO_HOME}doc/${anchor}"
rm "${REPO_HOME}doc/${anchor}"*.html >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}"*.css >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.gif >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.png >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.svg >> /dev/null 2>&1
"${DOC_SCRIPT}"  "${XSD_HOME}${anchor}.xsd"  -cfg:"${BASH_HOME}settings/doc.xml"
 
anchor="disdatalogplus_mid_normal"
mkdir -p "${REPO_HOME}doc/${anchor}"
rm "${REPO_HOME}doc/${anchor}"*.html >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}"*.css >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.gif >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.png >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.svg >> /dev/null 2>&1
"${DOC_SCRIPT}"  "${XSD_HOME}${anchor}.xsd"  -cfg:"${BASH_HOME}settings/doc.xml"

anchor="naffologeq_normal"
mkdir -p "${REPO_HOME}doc/${anchor}"
rm "${REPO_HOME}doc/${anchor}"*.html >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}"*.css >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.gif >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.png >> /dev/null 2>&1
rm "${REPO_HOME}doc/${anchor}/img"*.svg >> /dev/null 2>&1
"${DOC_SCRIPT}"  "${XSD_HOME}${anchor}.xsd"  -cfg:"${BASH_HOME}settings/doc.xml"

