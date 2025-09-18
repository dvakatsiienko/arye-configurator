# ARYE Configurator - Desktop Configuration App

## Project Overview

This repository manages releases for the ARYE Configurator, a desktop application that allows users to configure and customize ARYE gaming peripherals through an intuitive GUI. It uses GitHub Releases as the primary distribution channel with automated CI/CD workflows.

## Company Information

- **Company**: ARYE EQUIPMENT LTD
- **Website**: https://arye.hk/
- **Products**: Gaming mice and peripherals
- **Repository**: github.com/arye-equipment/driver-releases

## Application Features

- Device configuration and customization
- DPI profile management
- RGB lighting control
- Macro creation and management
- Profile save/load functionality
- Real-time device monitoring

## Supported Devices

- ARYE RCC-1 Gaming Mouse
- Additional peripherals coming soon

## Release Management

### Version Scheme
- Format: `vMAJOR.MINOR.PATCH` (e.g., v1.2.3)
- Major: Breaking changes or new product support
- Minor: New features, performance improvements
- Patch: Bug fixes, minor updates

### Release Process

**IMPORTANT: DO NOT manually create releases unless explicitly prompted!**

1. Tag version in git: `git tag v1.2.3`
2. Push tag: `git push origin v1.2.3`
3. GitHub Actions automatically:
   - Builds driver packages
   - Generates checksums
   - Creates GitHub Release
   - Uploads artifacts

**Note**: If GitHub Actions fails due to permissions:
- The workflow needs repository permissions to be fixed
- DO NOT manually create the release with `gh release create` unless instructed
- Releases should be created by GitHub Actions automation only

### Installer Package Naming
- Installer file: `arye-configurator-v1.2.3.exe`
- Release package: `arye-configurator-windows-v1.2.3.zip`
- Latest link: `arye-configurator-windows-latest.zip` (permanent URL)

## Directory Structure

```
github-releases/
├── .github/workflows/    # CI/CD automation
├── installers/          # Application installer files
├── docs/                # Documentation
├── scripts/             # Build and release scripts
└── releases/            # Release packages
```

## Development Guidelines

### Code Style
- Keep automation scripts simple and maintainable
- Document all workflows clearly
- Use semantic versioning strictly

### Testing
- Test release workflow with pre-release tags (e.g., v1.2.3-beta.1)
- Verify checksums for all artifacts
- Verify Windows 10/11 compatibility

### Security
- All installers must be signed
- Generate SHA256 checksums for all artifacts
- Scan for vulnerabilities before release
- Verify installer integrity

## CI/CD Configuration

The project uses GitHub Actions for:
- Automated builds on tag push
- Release creation and asset uploads
- Checksum generation and verification
- Windows build automation

## Support Channels

- GitHub Issues for bug reports
- Email: support@arye-equipment.com
- Internal: Use #driver-releases Slack channel

## Maintenance Tasks

- Release app updates monthly or as needed
- Review and update dependencies monthly
- Monitor download analytics weekly
- Respond to user issues within 24 hours
- Track feature requests and bug reports

## Changelog Management

The CHANGELOG.md (in root directory) is automatically maintained by GitHub Actions:

### On Every Push to Main
- The `update-changelog.yml` workflow runs
- Adds new commits to `[Unreleased]` section at the top
- Automatically commits the updated changelog with message: "github-action: refresh changelog [skip ci]"
- Excludes github-actions bot commits and merge commits from appearing in changelog
- Uses perl-regexp negative lookahead to filter commits by author

### On Release (Tag Push)
- The `release.yml` workflow runs
- Generates changelog with proper UTF-8 encoding (using BOM for Windows compatibility)
- Moves unreleased commits to the new version section
- Creates the GitHub release with direct download links
- Commits the updated changelog if changes exist

### Filtering Rules
- Excludes all commits from `github-actions[bot]` using: `--perl-regexp --author="^(?!.*github-actions)"`
- Excludes merge commits using: `--no-merges`
- Excludes commits with `[skip ci]` in the message

### Manual Update
To manually update the changelog:
```bash
./scripts/update-changelog.sh
```

### Known Issues Fixed
- UTF-8 emoji encoding issues in Windows PowerShell environment
- Author-based filtering using perl-regexp for robust exclusion
- Proper handling of smart quotes in commit messages

## Implementation Phases

### Phase 1: Basic Structure ✅
- Repository structure and README
- Basic release workflow
- Initial documentation

### Phase 2: Advanced CI/CD (Current)
- PR validation workflow
- Automated testing
- Security scanning

### Phase 3: Future Enhancements
- Landing page for downloads
- Download analytics integration
- Auto-update mechanism for drivers

## Pre-Release Checklist

Before creating a release, verify:
- [ ] Installer builds successfully
- [ ] SHA256 checksums generated
- [ ] Documentation updated (changelog, README)
- [ ] Version numbers consistent
- [ ] Test installation on clean Windows 10/11
- [ ] Verify app launches and connects to devices

## Post-Release Validation

After release is created:
- [ ] GitHub release page accessible
- [ ] Download links working
- [ ] Checksums match uploaded files
- [ ] Notify support team

## Advanced Features (Future)

### Auto-Update Mechanism
Create `version-manifest.json` for driver auto-updater:
```json
{
  "latest_version": "1.2.3",
  "download_url": "https://github.com/arye-equipment/driver-releases/releases/latest",
  "changelog_url": "https://github.com/arye-equipment/driver-releases/blob/main/docs/changelog.md",
  "minimum_version": "1.0.0"
}
```

### Download Analytics
Track downloads using GitHub API or custom analytics solution.

### Application Updates
Plan to implement auto-update mechanism within the configurator app.

## Important Notes

- **CRITICAL: DO NOT manually create GitHub releases unless explicitly instructed**
- Releases must be created through GitHub Actions automation
- Do not commit binary files directly to the repository
- Use GitHub Releases for all installer distribution
- Keep release notes clear and user-friendly
- Test thoroughly before creating production releases
- Sign installers with code certificate before release
- Scan for malware/vulnerabilities before packaging
- Test device connectivity before each release
- If Actions fails with "release already exists", it means someone manually created it - avoid this!