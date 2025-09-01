# OpenT3Base Contributor Checklist

Welcome! Before submitting a pull request or feature proposal, please review this checklist to ensure high quality, consistency, and smooth integration.

---

## 1. Understand the Architecture

- [ ] Familiarize yourself with the [architecture diagram](docs/architecture-diagram.md)
- [ ] Identify how your contribution fits into the overall system (module, cross-cutting, optional)

## 2. Issue & Proposal Preparation

- [ ] Search existing issues and discussions before opening new ones
- [ ] Clearly describe problem, solution, and scope
- [ ] Link to relevant module or documentation

## 3. Code & Documentation

- [ ] Follow existing code style and formatting conventions
- [ ] Write clear and descriptive commit messages
- [ ] Include/Update module-level README or relevant documentation
- [ ] Add/Update tests and ensure 100% pass rate
- [ ] Use or extend existing APIs where possible
- [ ] If creating a new module, consider using the [Module Creation Tool](docs/MODULE_CREATION.md)

## 4. Internationalization & Accessibility

- [ ] All UI and user-facing content is localizable (no hardcoded text)
- [ ] Check accessibility (contrast, keyboard, ARIA labels, etc.)

## 5. Security & Compliance

- [ ] Validate all input and handle errors gracefully
- [ ] Consider security best practices (auth, permissions, secrets)
- [ ] If touching compliance/audit modules, ensure traceability

## 6. Integration

- [ ] Check for circular dependencies between modules
- [ ] Use shared data models and API contracts
- [ ] Test integration with at least one other module if applicable

## 7. Community & Ecosystem

- [ ] If adding an extension/plugin, follow marketplace guidelines
- [ ] For API/SDK work, update developer documentation
- [ ] Engage in discussions for major changes

## 8. Testing & CI

- [ ] Run all relevant unit and integration tests
- [ ] Verify successful build in CI/CD pipeline
- [ ] Check for regressions or breaking changes

## 9. Licensing & Credits

- [ ] Ensure all code and dependencies are compatible with project’s open-source license
- [ ] Attribute any third-party code or resources as required

---

Thank you for contributing to OpenT3Base!  
— The Maintainers