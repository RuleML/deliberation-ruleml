# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased][unreleased]

<!--## [v1.02final] - 2016-xx-yy-->

<!--## [v1.02external] - 2015-xx-yy-->

<!--## [v1.02internal] - 2015-xx-yy-->
### Added

### Changed
- stripe-skipping was modularized to separate the skipping of if-then stripes in Imples and the skipping of op. This change allows for fine-tuning of stripe-skipping to accommodate conversion to XSD in those cases where skipping of particular edges leads to XSD validation errors. [5e4617f]
  
### Fixed

### Removed

[unreleased]: https://github.com/RuleML/deliberation-ruleml/compare/v1.02initial...HEAD
<!---
[v1.02final]: https://github.com/RuleML/deliberation-ruleml/compare/v1.02external...v1.02final
[v1.02external]: https://github.com/RuleML/deliberation-ruleml/compare/v1.02internal...v1.02external
[v1.02internal]: https://github.com/RuleML/deliberation-ruleml/compare/v1.02initial...v1.02internal
[5e4617f]: https://github.com/RuleML/deliberation-ruleml/commit/5e4617febb0a97ff10eb74b76ff08064a62a1e40 
-->
