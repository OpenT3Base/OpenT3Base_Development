# Branch Protection Rules Configuration

This document outlines the branch protection rules that should be configured for the OpenT3Base repository.

## GitHub Repository Settings

### Branch Protection Rules for `main`

The following settings should be configured in GitHub repository settings under Settings > Branches:

#### Protect matching branches
- **Branch name pattern**: `main`

#### Restrict pushes that create files
- ✅ **Restrict pushes that create files**

#### Require a pull request before merging
- ✅ **Require a pull request before merging**
- ✅ **Require approvals**: 1
- ✅ **Dismiss stale PR approvals when new commits are pushed**
- ✅ **Require review from code owners** (when CODEOWNERS file exists)

#### Require status checks to pass before merging
- ✅ **Require status checks to pass before merging**
- ✅ **Require branches to be up to date before merging**

Required status checks:
- `validate` (Validate Repository)
- `linear-history` (Check Linear History) 
- `security-check` (Security Check)

#### Require conversation resolution before merging
- ✅ **Require conversation resolution before merging**

#### Require signed commits
- ⚪ **Require signed commits** (recommended but optional)

#### Require linear history
- ✅ **Require linear history**

#### Require deployments to succeed before merging
- ⚪ **Require deployments to succeed before merging** (if applicable)

#### Lock branch
- ⚪ **Lock branch** (only in emergency situations)

#### Do not allow bypassing the above settings
- ✅ **Do not allow bypassing the above settings**

#### Restrict pushes that create files
- ✅ **Restrict pushes that create files**

## Manual Configuration Steps

Repository administrators should configure these rules by:

1. Navigate to repository Settings > Branches
2. Click "Add rule" next to "Branch protection rules"
3. Set branch name pattern to `main`
4. Configure all the settings listed above
5. Save the protection rule

## Automation Notes

While these rules are configured manually in GitHub settings, the CI workflow (`.github/workflows/ci.yml`) provides the required status checks that enforce:

- Repository validation
- Linear history requirements
- Security scanning
- Documentation quality

## Verification

To verify branch protection is working:

1. Attempt to push directly to main (should be blocked)
2. Create a PR with failing checks (should prevent merge)
3. Create a PR with merge commit (should be blocked by linear history check)
4. Verify that all status checks are required and passing

## Updates

When adding new required checks:

1. Update the CI workflow first
2. Test the new checks on a feature branch
3. Update this configuration document
4. Add the new check to required status checks in GitHub settings