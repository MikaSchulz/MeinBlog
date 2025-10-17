<!--
Sync Impact Report
- Version change: 1.0.0 → 1.1.0
- List of modified principles: Added VI. Cross-Platform Compatibility
- Added sections: None
- Removed sections: None
- Templates requiring updates: plan-template.md (✅), spec-template.md (✅), tasks-template.md (✅)
- Follow-up TODOs: TODO(RATIFICATION_DATE): Initial ratification
-->

# MeinBlog Constitution

## Core Principles

### I. Simplicity
The project must be kept as simple as possible. Complexity should be avoided unless strictly necessary for functionality.

### II. Maintainability
The code and project structure must be designed to allow easy future changes and extensions.

### III. Automated Testing
The most important features and pages are covered by automated tests. Tests are mandatory before merging new features.

### IV. Traceable Changes
All changes to the project must be traceable (e.g., through commit messages and pull requests).

### V. Minimal Dependencies
No large or unnecessary dependencies are allowed. External libraries are only used if they provide clear value.

### VI. Cross-Platform Compatibility
All commands and scripts must use Bash syntax, regardless of the operating system on which they are executed. This ensures consistency and portability across different development environments.
Any paths must be in this format: `path/to/file` (using forward slashes).
Example: `/d/Projects/MeinBlog/`
No windows style paths (e.g., `path\to\file`) are allowed.

## Additional Requirements
The project is based on Hugo. No large frameworks or build tools are used. Installation and usage must remain simple.

## Governance
This constitution takes precedence over other project practices. Changes to the constitution must be documented and recorded in the repository. Versioning follows semantic rules (MAJOR.MINOR.PATCH). Compliance is checked with every merge.

**Version**: 1.1.0 | **Ratified**: TODO(RATIFICATION_DATE): Initial ratification | **Last Amended**: 2025-10-17
