# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased][unreleased]

## [v1.02final] - 2015-09-21

### Added
- more examples in exa directory
- compactifier and normalizer XSLT, and formatting tests and bash script, included in main build script
- normalizer does sorting by @index
- extra post-processing step in rnc2xsd to achieve required @index
- "basedrop" compactifiers transfer the xml:base attribute to the child node when skipping stripes, if possible
- drivers for compact serialization
- drivers include new deliberation module for datatype annotation
- path configuration script
- bash script, schemas, and xslt for instance generation testing relative to Reaction RuleML's dr.xsd
- bash scripts, and "stripwhitespace" xslts for round-trip law testing of compactifier/normalizer and normalizer/compactifier transformations
- README.html and HEADER.html for schema directories

### Changed
- wiki documentation at http://wiki.ruleml.org/index.php?title=Specification_of_Consumer_RuleML_1.02&diff=15669&oldid=14589
- build scripts, to include building the zip package, better logging and messages, 
  quoting of all file paths so directory and file names with spaces are allowed,
  generated instance testing for Reaction RuleML
  
### Fixed
- required @index in content edge
- metadata and documentation in schemas, tests, and bash scripts
- bash script for building the zip file
- drivers, adding missing module, correcting typos, accommodating refactoring in Deliberation RuleML
- rnc2xsd.xslt, to refer to correct online xml.xsd, and include RuleML datatypes XSD

### Removed
- temporary files that should not have been under version control

## [v1.02external] - 2015-05-12

### Added
- predefined semantic styles at http://wiki.ruleml.org/index.php/Predefined_Semantic_Styles_of_RuleML_1.02
- wiki page for putting Consumer RuleML, and other families, into context http://wiki.ruleml.org/index.php/Specification_of_RuleML_1.02
- examples
- optional @index to formulas in Operation

### Changed
- wiki documentation at http://wiki.ruleml.org/index.php?title=Specification_of_Consumer_RuleML_1.02&diff=14589&oldid=13837
  for clarification
- namespace prefix in FIPA example, to clarify which are RuleML elements
- syntax regarding Allen operators, so that an Interval wrapper is no longer required
- Operator to Operation
- to adapt to refactoring in modules imported from Deliberation

### Fixed
- content model of Naf, to allow Operation as a child
- missing glossary entries for temporal logic constructs


## [v1.02internal] - 2015-03-21

### Added
- bash directory, with bash build and test scripts
- designPattern directory, containing the design pattern schema, for validation
- docs directory, containing generated schema docs
- exa directory, containing examples
- nvdl directory, containing fipa and soap nvdl schemas
- relaxng, containing drivers and modules
- simplified directory, containing monolithic RNC content model
- tests, containing success and failure validation tests
- xsd, including generated XSD schemas
- xslt, including XSLT transformations for formatting, as well as post-processing instances and XSD
- wiki documentation at http://wiki.ruleml.org/index.php/Specification_of_Consumer_RuleML_1.02
- wiki glossary at http://wiki.ruleml.org/index.php/Glossary_of_Consumer_RuleML_1.02


[unreleased]: https://github.com/RuleML/consumer-ruleml/compare/v1.02final...HEAD
[v1.02final]: https://github.com/RuleML/consumer-ruleml/compare/v1.02external...v1.02final
[v1.02external]: https://github.com/RuleML/consumer-ruleml/compare/v1.02internal...v1.02external
[v1.02internal]: https://github.com/RuleML/consumer-ruleml/compare/v1.02initial...v1.02internal
