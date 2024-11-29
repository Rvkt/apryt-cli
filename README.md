# Versioning Explanation

The versioning format used for `apryt` follows a structured naming convention, making it easy to understand the status and release details at a glance. Here’s a breakdown of the format:

## Format: `apryt-prod-1.0.0-release-D20241130T020751`

### 1. `apryt-prod`
- **`apryt`**: This is the name of the tool.
- **`prod`**: This indicates that the release is for the production environment, as opposed to development (`dev`) or staging (`staging`). It shows that the tool is stable and ready for end-users.

### 2. `1.0.0`
- **Version Number**: This follows the Semantic Versioning convention (SemVer), which includes three parts:
    - **`1`** (Major Version): Indicates significant changes that may break backward compatibility. This could include major new features or changes that require updates to existing functionality.
    - **`0`** (Minor Version): Represents backward-compatible improvements or new features that do not break existing functionality.
    - **`0`** (Patch Version): Represents bug fixes or minor improvements that do not affect the overall functionality of the tool.

### 3. `release`
- **`release`**: This indicates the type of release. In this case, it’s a stable release intended for production use. Other types may include `beta`, `alpha`, or `dev`, indicating pre-production or testing versions.

### 4. `D20241130T020751`
- **`D`**: This stands for "Date", indicating that the following value represents the date and time of the release.
- **`20241130`**: This is the **date** of the release in the format `YYYYMMDD`. In this case, the release was created on **November 30, 2024**.
- **`T020751`**: This represents the **time** of the release, formatted as `HHMMSS` (hours, minutes, and seconds). In this case, the release was created at **02:07:51 AM** in the **local machine's time zone** (not UTC).

### Full Example Breakdown
- `apryt-prod-1.0.0-release-D20241130T020751`: A production release of the `apryt` tool, version `1.0.0`, released on **November 30, 2024**, at **02:07:51 AM** local machine time.

---

This versioning system helps users quickly identify the release type, version, and exact build time based on the local machine's time zone, ensuring clarity and traceability for each deployment.