# Changelog

## 1.0.0 (2024-11-30)

- Initial release of `apryt` CLI tool for Flutter developers.
- Added functionality for versioning releases, following a structured format: `apryt-prod-1.0.0-release-DYYYYMMDDTHHMMSS`.
- Implemented the ability to generate production and release versions with unique timestamps based on the local machine's time zone.
- Included a command to create a production release: `apryt prod release`.
- Ensured the package is ready for distribution and publishing on `pub.dev`.


## 1.1.0 (2024-12-05)

- Added the `init` command to set up the project structure.
    - Creates essential folders such as `assets`, `lib/core`, `lib/data/network`, and `lib/widgets/common`.
    - Initializes core files, API-related files, and common widgets.
    - Prints a success message upon completion.
    - Generated app name is now copied to clipboard.
- Improved error handling and logging for better CLI usability.
- Minor bug fixes and optimizations.
