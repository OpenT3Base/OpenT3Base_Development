#!/bin/bash

# OpenT3Base Module Creation Tool
# This script creates a new module based on the standard OpenT3Base module template

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_color() {
    printf "${1}${2}${NC}\n"
}

print_header() {
    print_color $BLUE "=========================================="
    print_color $BLUE "    OpenT3Base Module Creation Tool"
    print_color $BLUE "=========================================="
}

print_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -n, --name MODULE_NAME          Module name (e.g., 'WMS' for Warehouse Management System)"
    echo "  -d, --description DESCRIPTION   Module description (e.g., 'Warehouse Management System')"
    echo "  -p, --purpose PURPOSE          Module purpose description"
    echo "  -t, --tech TECH_STACK          Technology stack: 'typescript' or 'python' (default: typescript)"
    echo "  -r, --resource RESOURCE         Main resource name (e.g., 'warehouse', 'product')"
    echo "  --port PORT                     Backend port number (default: auto-assigned)"
    echo "  --interactive                   Interactive mode (prompts for all inputs)"
    echo "  -h, --help                     Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 --name WMS --description 'Warehouse Management System' --purpose 'manages warehouse operations and inventory tracking' --tech typescript --resource warehouse"
}

# Default values
TECH_STACK="typescript"
INTERACTIVE=false
PORT=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--name)
            MODULE_NAME="$2"
            shift 2
            ;;
        -d|--description)
            MODULE_DESCRIPTION="$2"
            shift 2
            ;;
        -p|--purpose)
            MODULE_PURPOSE="$2"
            shift 2
            ;;
        -t|--tech)
            TECH_STACK="$2"
            shift 2
            ;;
        -r|--resource)
            RESOURCE_NAME="$2"
            shift 2
            ;;
        --port)
            PORT="$2"
            shift 2
            ;;
        --interactive)
            INTERACTIVE=true
            shift
            ;;
        -h|--help)
            print_header
            print_usage
            exit 0
            ;;
        *)
            print_color $RED "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Interactive mode
if [[ "$INTERACTIVE" == "true" ]]; then
    print_header
    print_color $YELLOW "Interactive Module Creation Mode"
    echo ""
    
    read -p "Module name (e.g., WMS): " MODULE_NAME
    read -p "Module description (e.g., Warehouse Management System): " MODULE_DESCRIPTION
    read -p "Module purpose: " MODULE_PURPOSE
    read -p "Technology stack (typescript/python) [typescript]: " TECH_INPUT
    TECH_STACK=${TECH_INPUT:-typescript}
    read -p "Main resource name (e.g., warehouse): " RESOURCE_NAME
    read -p "Backend port (leave empty for auto-assignment): " PORT
fi

# Validate required parameters
if [[ -z "$MODULE_NAME" ]]; then
    print_color $RED "Error: Module name is required"
    print_usage
    exit 1
fi

if [[ -z "$MODULE_DESCRIPTION" ]]; then
    print_color $RED "Error: Module description is required"
    print_usage
    exit 1
fi

if [[ -z "$MODULE_PURPOSE" ]]; then
    MODULE_PURPOSE="handles $MODULE_DESCRIPTION operations"
fi

if [[ -z "$RESOURCE_NAME" ]]; then
    RESOURCE_NAME=$(echo "$MODULE_NAME" | tr '[:upper:]' '[:lower:]')
fi

# Validate technology stack
if [[ "$TECH_STACK" != "typescript" && "$TECH_STACK" != "python" ]]; then
    print_color $RED "Error: Technology stack must be 'typescript' or 'python'"
    exit 1
fi

# Auto-assign port if not provided
if [[ -z "$PORT" ]]; then
    # Find the next available port starting from 3001
    PORT=3001
    while [[ -d "modules/"*"/backend" ]]; do
        # Check if port is used in any existing backend
        if grep -r "port.*$PORT" modules/*/backend/ >/dev/null 2>&1; then
            ((PORT++))
        else
            break
        fi
        if [[ $PORT -gt 3100 ]]; then
            print_color $RED "Error: Could not find available port"
            exit 1
        fi
    done
fi

# Convert names to different formats
MODULE_NAME_LOWER=$(echo "$MODULE_NAME" | tr '[:upper:]' '[:lower:]')
RESOURCE_NAME_LOWER=$(echo "$RESOURCE_NAME" | tr '[:upper:]' '[:lower:]')
RESOURCE_NAME_PLURAL="${RESOURCE_NAME_LOWER}s"
RESOURCE_NAME_SNAKE=$(echo "$RESOURCE_NAME_LOWER" | sed 's/-/_/g')
RESOURCE_PATH="$RESOURCE_NAME_PLURAL"

# Check if module already exists
if [[ -d "modules/$MODULE_NAME_LOWER" ]]; then
    print_color $RED "Error: Module '$MODULE_NAME_LOWER' already exists"
    exit 1
fi

print_header
print_color $GREEN "Creating new module: $MODULE_NAME"
print_color $BLUE "Description: $MODULE_DESCRIPTION"
print_color $BLUE "Technology: $TECH_STACK"
print_color $BLUE "Resource: $RESOURCE_NAME"
print_color $BLUE "Port: $PORT"
echo ""

# Create module directory
MODULE_DIR="modules/$MODULE_NAME_LOWER"
mkdir -p "$MODULE_DIR"

# Copy and process README template
print_color $YELLOW "Creating README.md..."
sed -e "s/{{MODULE_NAME}}/$MODULE_NAME/g" \
    -e "s/{{MODULE_DESCRIPTION}}/$MODULE_DESCRIPTION/g" \
    -e "s/{{MODULE_PURPOSE}}/$MODULE_PURPOSE/g" \
    -e "s/{{FEATURE_1}}/Core $RESOURCE_NAME management/g" \
    -e "s/{{FEATURE_2}}/$MODULE_DESCRIPTION operations/g" \
    -e "s/{{FEATURE_3}}/Integration with other modules/g" \
    -e "s/{{FEATURE_4}}/API endpoints for external access/g" \
    -e "s/{{INTEGRATION_DESCRIPTION_1}}/Integrates with ERP for financial data/g" \
    -e "s/{{INTEGRATION_DESCRIPTION_2}}/Connects to other modules via unified API/g" \
    -e "s/{{MODULE_ROLE}}/$MODULE_NAME provides essential $MODULE_DESCRIPTION capabilities within the OpenT3Base ecosystem./g" \
    templates/module-template/README.md > "$MODULE_DIR/README.md"

# Create backend directory and files
print_color $YELLOW "Creating backend..."
mkdir -p "$MODULE_DIR/backend"

if [[ "$TECH_STACK" == "typescript" ]]; then
    sed -e "s/{{MODULE_NAME}}/$MODULE_NAME/g" \
        -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
        -e "s/{{RESOURCE_NAME_PLURAL}}/$RESOURCE_NAME_PLURAL/g" \
        -e "s/{{RESOURCE_PATH}}/$RESOURCE_PATH/g" \
        -e "s/{{PORT}}/$PORT/g" \
        templates/module-template/backend/index.ts > "$MODULE_DIR/backend/index.ts"
else
    sed -e "s/{{MODULE_NAME}}/$MODULE_NAME/g" \
        -e "s/{{RESOURCE_NAME}}/$RESOURCE_NAME/g" \
        -e "s/{{RESOURCE_NAME_PLURAL}}/$RESOURCE_NAME_PLURAL/g" \
        -e "s/{{RESOURCE_NAME_SNAKE}}/$RESOURCE_NAME_SNAKE/g" \
        -e "s/{{RESOURCE_PATH}}/$RESOURCE_PATH/g" \
        -e "s/{{ID_FIELD}}/${RESOURCE_NAME_SNAKE}_id/g" \
        -e "s/{{EXAMPLE_ID}}/${MODULE_NAME}001/g" \
        -e "s/{{EXAMPLE_FIELD}}/name/g" \
        -e "s/{{EXAMPLE_VALUE}}/Example $RESOURCE_NAME/g" \
        -e "s/{{PORT}}/$PORT/g" \
        templates/module-template/backend/app.py > "$MODULE_DIR/backend/app.py"
fi

# Create frontend directory and files
print_color $YELLOW "Creating frontend..."
mkdir -p "$MODULE_DIR/frontend"
sed -e "s/{{MODULE_NAME}}/$MODULE_NAME/g" \
    -e "s/{{MODULE_DESCRIPTION}}/$MODULE_DESCRIPTION/g" \
    templates/module-template/frontend/App.tsx > "$MODULE_DIR/frontend/App.tsx"

print_color $GREEN "✓ Module '$MODULE_NAME' created successfully!"
print_color $BLUE "Location: $MODULE_DIR"
echo ""
print_color $YELLOW "Next Steps:"
echo "1. Review and customize the generated files"
echo "2. Add the module to the main documentation"
echo "3. Implement your specific business logic"
echo "4. Add tests for your module"
echo "5. Update integration documentation"
echo ""
print_color $GREEN "Happy coding! 🚀"