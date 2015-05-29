# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
This directory contains build scripts for Deliberation RuleML
There are two top-level build scripts:
* build_myng.sh : this builds the generated RNC and XSD locally and tests it against local test suites
* build_web.sh : (under development) this builds the generated RNC and XSD from the cload and tests it against cloud-stored test suites

These scripts call incremental build scripts which can be manually activated for partial builds.
See the top-level build scripts for details.
