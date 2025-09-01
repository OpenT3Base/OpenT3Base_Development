# GitHub Configuration

This directory contains GitHub-specific configuration files for the OpenT3Base repository.

## Files

### Workflows (`workflows/`)
- **`ci.yml`** - Main CI/CD pipeline that enforces branch protection through status checks

### Documentation
- **`BRANCH_PROTECTION.md`** - Configuration guide for GitHub branch protection rules

## Branch Protection Implementation

OpenT3Base implements branch protection through a combination of:

1. **GitHub Branch Protection Rules** - Configured in repository settings
2. **Required Status Checks** - Automated via GitHub Actions workflows  
3. **Security Policies** - Documented in [`SECURITY.md`](../SECURITY.md)
4. **Contributor Guidelines** - Updated contributor checklist

## Key Features

- ✅ **No direct pushes to main** - All changes via pull requests
- ✅ **Required status checks** - Automated validation, security, and history checks
- ✅ **Linear history enforcement** - No merge commits allowed
- ✅ **Security scanning** - Automatic detection of secrets and security issues
- ✅ **Documentation validation** - Ensures required files and structure
- ✅ **Commit message standards** - Enforces descriptive commit messages

## Setup for Repository Administrators

1. Review [`BRANCH_PROTECTION.md`](BRANCH_PROTECTION.md) for detailed configuration steps
2. Configure branch protection rules in GitHub repository settings
3. Ensure all required status checks are enabled
4. Test the configuration with a test pull request

## For Contributors

Review the updated [Contributor Checklist](../CONTRIBUTOR_CHECKLIST.md) for requirements when submitting pull requests to protected branches.