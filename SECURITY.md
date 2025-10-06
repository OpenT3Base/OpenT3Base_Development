# Security Policy

## Branch Protection

OpenT3Base implements strict branch protection rules to maintain code quality, security, and project integrity.

### Protected Branches

The following branches are protected and have specific requirements:

#### `main` Branch
- **No force pushes allowed** - History must remain linear and intact
- **No direct pushes allowed** - All changes must go through pull requests
- **Deletion protection** - The main branch cannot be deleted
- **Required status checks** - All CI checks must pass before merging
- **Required reviews** - Pull requests require review approval
- **Linear history required** - Merge commits are not allowed; use rebase or squash merge

### Required Status Checks

All pull requests targeting protected branches must pass these automated checks:

1. **Repository Validation** (`validate`)
   - Verifies required files are present
   - Validates documentation structure
   - Checks commit message quality
   - Validates Markdown files

2. **Linear History Check** (`linear-history`)
   - Ensures no merge commits exist in the PR
   - Maintains clean, linear git history

3. **Security Check** (`security-check`)
   - Scans for potential secrets or sensitive data
   - Validates secure coding practices

### Commit Standards

To maintain branch protection requirements:

- **Commit Messages**: Must be descriptive (minimum 10 characters)
- **No Secrets**: Never commit API keys, passwords, or sensitive data
- **Documentation**: Update relevant documentation with code changes
- **Testing**: Include tests for new functionality

### Pull Request Requirements

All pull requests must:

1. Target the `main` branch from a feature branch
2. Pass all automated status checks
3. Follow the [Contributor Checklist](CONTRIBUTOR_CHECKLIST.md)
4. Have a clear description of changes
5. Include updated documentation if applicable

### Emergency Procedures

In case of critical security issues:

1. Create a security advisory before making changes public
2. Follow responsible disclosure practices
3. Emergency fixes may be applied directly by maintainers with post-hoc review

### Enforcement

These policies are enforced through:

- GitHub branch protection rules
- Automated CI/CD pipelines
- Required status checks
- Peer review processes

### Violations

Violations of branch protection policies may result in:

- Rejection of pull requests
- Request for remediation
- Additional review requirements
- In severe cases, restriction of repository access

### Contact

For questions about security policies or to report security vulnerabilities:

- Open a GitHub issue for policy questions
- Use GitHub's security advisory feature for vulnerabilities
- Contact maintainers for urgent security matters

---

*This security policy is reviewed and updated regularly to ensure the protection of OpenT3Base and its contributors.*