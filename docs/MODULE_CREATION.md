# Module Creation Guide

This guide explains how to create new modules within the OpenT3Base ecosystem using the automated module creation tool.

## Overview

OpenT3Base follows a modular architecture where each module represents a specific business domain (PLM, MRP, SCM, etc.). The module creation tool helps maintain consistency across modules by providing standardized templates and structure.

## Quick Start

### Using the Interactive Mode

The easiest way to create a new module is using the interactive mode:

```bash
./tools/create-module.sh --interactive
```

This will prompt you for all necessary information step by step.

### Using Command Line Arguments

For automation or when you know all the parameters:

```bash
./tools/create-module.sh \
  --name WMS \
  --description "Warehouse Management System" \
  --purpose "manages warehouse operations and inventory tracking" \
  --tech typescript \
  --resource warehouse
```

## Module Structure

Each module follows this standard structure:

```
modules/[module-name]/
├── README.md           # Module documentation
├── backend/            # Backend implementation
│   ├── index.ts        # TypeScript/Express server
│   └── app.py          # Python/Flask server (alternative)
└── frontend/           # Frontend implementation
    └── App.tsx         # React component
```

## Technology Stacks

The tool supports two backend technology stacks:

### TypeScript (Default)
- **Framework**: Express.js
- **Language**: TypeScript
- **File**: `backend/index.ts`
- **Use case**: Recommended for new modules

### Python
- **Framework**: Flask
- **Language**: Python
- **File**: `backend/app.py`
- **Use case**: When Python is preferred or required

## Command Line Options

| Option | Short | Description | Required | Default |
|--------|-------|-------------|----------|---------|
| `--name` | `-n` | Module name (e.g., 'WMS') | Yes | - |
| `--description` | `-d` | Module description | Yes | - |
| `--purpose` | `-p` | Module purpose description | No | Auto-generated |
| `--tech` | `-t` | Technology stack: 'typescript' or 'python' | No | typescript |
| `--resource` | `-r` | Main resource name | No | Module name (lowercase) |
| `--port` | - | Backend port number | No | Auto-assigned |
| `--interactive` | - | Interactive mode | No | false |
| `--help` | `-h` | Show help message | No | - |

## Examples

### Creating a Warehouse Management System

```bash
./tools/create-module.sh \
  --name WMS \
  --description "Warehouse Management System" \
  --purpose "manages warehouse operations, inventory tracking, and space optimization" \
  --tech typescript \
  --resource warehouse \
  --port 3010
```

### Creating a Fleet Management Module

```bash
./tools/create-module.sh \
  --name Fleet \
  --description "Fleet Management" \
  --purpose "tracks and manages company vehicles, maintenance, and routing" \
  --tech python \
  --resource vehicle
```

### Creating a Custom Business Module

```bash
./tools/create-module.sh \
  --name CustomBiz \
  --description "Custom Business Logic" \
  --purpose "handles specific business requirements unique to your organization" \
  --resource business_unit
```

## After Module Creation

Once your module is created, follow these steps:

### 1. Review Generated Files

Examine the generated files and customize them according to your specific requirements:

- **README.md**: Update features, integration points, and role description
- **Backend**: Implement your API endpoints and business logic
- **Frontend**: Build your user interface components

### 2. Update Main Documentation

Add your new module to the main project documentation:

```markdown
# In docs/README.md or document/README.md, add to the Modules section:
- [Your Module Name](./your-module/README.md)
```

### 3. Implement Business Logic

Replace the placeholder code with your actual implementation:

- Define your data models
- Implement CRUD operations
- Add validation and error handling
- Set up database connections if needed

### 4. Add Tests

Create tests for your module (framework dependent on your setup):

```bash
# Example structure
modules/your-module/
├── backend/
│   ├── tests/
│   │   ├── test_api.py
│   │   └── test_models.py
└── frontend/
    └── __tests__/
        └── App.test.tsx
```

### 5. Configure Integration

Update integration points with other modules:

- Define shared data models
- Set up API contracts
- Configure inter-module communication

## Best Practices

### Naming Conventions

- **Module names**: Use descriptive acronyms (PLM, MRP, WMS) or short names
- **Resource names**: Use singular form (warehouse, product, order)
- **File names**: Follow the existing project conventions

### Documentation

- Write clear, comprehensive README files
- Document all API endpoints
- Include integration examples
- Provide setup and configuration instructions

### Code Structure

- Follow the existing code style in the repository
- Use consistent error handling patterns
- Implement proper logging
- Include input validation

### Integration

- Use the unified data layer for consistency
- Follow API-first principles
- Ensure module can run independently
- Test integration with at least one other module

## Port Management

The tool automatically assigns available ports starting from 3001. If you need a specific port, use the `--port` option. Current port assignments:

- PLM: 3001
- MRP: 3002
- Your new modules: 3003+

## Troubleshooting

### Common Issues

**Module already exists:**
```bash
Error: Module 'wms' already exists
```
Solution: Choose a different module name or remove the existing module.

**Invalid technology stack:**
```bash
Error: Technology stack must be 'typescript' or 'python'
```
Solution: Use either 'typescript' or 'python' for the `--tech` option.

**Permission denied:**
```bash
Permission denied: ./tools/create-module.sh
```
Solution: Make the script executable with `chmod +x tools/create-module.sh`

### Getting Help

For additional help:

```bash
./tools/create-module.sh --help
```

Or refer to the [Contributor Checklist](../CONTRIBUTOR_CHECKLIST.md) for general contribution guidelines.

## Contributing

If you have suggestions for improving the module creation tool:

1. Open an issue describing the enhancement
2. Follow the contribution guidelines in [CONTRIBUTOR_CHECKLIST.md](../CONTRIBUTOR_CHECKLIST.md)
3. Submit a pull request with your improvements

---

Happy module creation! 🚀