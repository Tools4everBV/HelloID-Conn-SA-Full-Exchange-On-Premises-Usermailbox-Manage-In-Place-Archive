# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [2.0.0] - 2026-08-26

### Changed

- Refactored code to follow modern PowerShell best practices with parameter splatting
- Improved error handling with structured try-catch-finally blocks and detailed error messages including line numbers
- Enhanced audit logging with consistent structured format using tags and proper action messages
- Modernized Exchange session management with explicit session options and specific command imports
- Updated filter logic to query multiple mailbox properties (Name, SamAccountName, Alias, PrimarySmtpAddress)
- Added wildcard support with `*` to query all user mailboxes

### Added

- Added TLS 1.2 protocol enforcement for enhanced security
- Added detailed action messages throughout the code for better debugging and troubleshooting
- Added `propertiesToSelect` array to optimize memory usage and processing speed
- Added support for filtering by `RecipientTypeDetails` to ensure only user mailboxes are returned
- Added comprehensive warning messages with script line numbers for debugging
- Added `commands` array to explicitly import only required Exchange cmdlets

### Fixed

- Corrected Exchange session cleanup with proper error handling in finally block
- Fixed archive status detection logic to properly check ArchiveGuid for enabled/disabled state

## [1.0.0] - 2023-08-18

### Added

- Initial release for managing in-place archive on Exchange On-Premises user mailboxes
