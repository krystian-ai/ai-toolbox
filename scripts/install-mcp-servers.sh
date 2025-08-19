#!/bin/bash

# MCP Servers Installation Script for Linux/macOS
# AI Toolbox - One-command installation for MCP servers
# Usage: curl -sSL https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.sh | bash

set -e

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly GRAY='\033[0;37m'
readonly NC='\033[0m' # No Color

# MCP Server Configurations
declare -A MCP_SERVERS=(
    ["playwright"]="npx @playwright/mcp@latest||Browser automation and web testing|Web Automation"
    ["context7"]="https://mcp.context7.com/sse||Context management and search|Productivity|--transport sse"
    ["testsprite"]="npx -y @testsprite/testsprite-mcp@latest|TESTSPRITE_API_KEY|Test automation and validation|Testing|API_KEY"
    ["sequential-thinking"]="npx -y @modelcontextprotocol/server-sequential-thinking||Sequential thinking and reasoning|AI Enhancement"
    ["fetch"]="npx -y @kazuph/mcp-fetch||HTTP fetch and web requests|Web Tools"
    ["brave-search"]="npx -y @modelcontextprotocol/server-brave-search|BRAVE_API_KEY|Web search using Brave Search API|Search|BRAVE_API_KEY"
    ["firecrawl"]="npx -y firecrawl-mcp|FIRECRAWL_API_KEY|Web scraping and content extraction|Web Tools|FIRECRAWL_API_KEY"
    ["github"]="npx -y @github/github-mcp-server||GitHub repository management|Development"
)

print_banner() {
    echo
    echo -e "${BLUE}============================================================${NC}"
    echo -e "${BLUE}                AI Toolbox - MCP Server Installer${NC}"
    echo -e "${CYAN}    One-command installation for Claude Code MCP servers${NC}"
    echo -e "${BLUE}============================================================${NC}"
    echo
}

print_separator() {
    echo -e "${BLUE}------------------------------------------------------------${NC}"
}

log_info() {
    echo -e "${CYAN}$1${NC}"
}

log_success() {
    echo -e "${GREEN}$1${NC}"
}

log_error() {
    echo -e "${RED}$1${NC}"
}

log_warning() {
    echo -e "${YELLOW}$1${NC}"
}

log_highlight() {
    echo -e "${PURPLE}$1${NC}"
}

check_prerequisites() {
    log_info "Checking prerequisites..."
    
    # Check Claude Code CLI
    if ! command -v claude &> /dev/null; then
        log_error "✗ Claude Code CLI not found!"
        echo "Install it with: npm install -g @anthropic/claude-code"
        echo "Or visit: https://docs.anthropic.com/en/docs/claude-code/setup"
        exit 1
    fi
    log_success "✓ Claude Code CLI found"
    
    # Check Node.js/npx
    if ! command -v npx &> /dev/null; then
        log_error "✗ Node.js/npx not found!"
        echo "Download from: https://nodejs.org/"
        exit 1
    fi
    log_success "✓ Node.js/npx found"
    
    echo
}

get_api_key() {
    local env_var=$1
    local service_name=$2
    local instructions=$3
    
    # Check if environment variable exists
    local api_key="${!env_var}"
    
    if [[ -n "$api_key" ]]; then
        log_success "✓ Found $service_name API key in environment ($env_var)"
        echo "$api_key"
        return 0
    fi
    
    # Prompt for API key
    log_warning "⚠ $service_name requires an API key"
    if [[ -n "$instructions" ]]; then
        log_info "Instructions: $instructions"
    fi
    
    echo -n "Enter your $env_var API key (or press Enter to skip): "
    read -r api_key
    
    if [[ -z "$api_key" ]]; then
        log_warning "Skipping $service_name installation"
        return 1
    fi
    
    # Offer to save the API key
    echo -n "Save this API key to your ~/.bashrc? (y/N): "
    read -r save_choice
    if [[ "$save_choice" =~ ^[Yy]$ ]]; then
        echo "export $env_var=\"$api_key\"" >> ~/.bashrc
        log_success "✓ API key saved to ~/.bashrc"
        echo "Note: Restart your terminal or run 'source ~/.bashrc' to use the saved key"
    fi
    
    echo "$api_key"
    return 0
}

show_server_menu() {
    log_info "Available MCP Servers:"
    echo
    
    # Create arrays for grouping
    local -A categories
    local server_list=()
    local index=1
    
    # Group servers by category and build index
    for server in "${!MCP_SERVERS[@]}"; do
        IFS='|' read -r command env_var description category extra_args <<< "${MCP_SERVERS[$server]}"
        categories["$category"]+="$index:$server:$description:$env_var "
        server_list[index]="$server"
        ((index++))
    done
    
    # Display grouped servers
    for category in $(printf '%s\n' "${!categories[@]}" | sort); do
        log_highlight "[$category]"
        for item in ${categories[$category]}; do
            IFS=':' read -r idx name desc env <<< "$item"
            local api_required=""
            [[ -n "$env" ]] && api_required=" (API key required)"
            echo "  $idx) $name$api_required"
            echo -e "     ${GRAY}$desc${NC}"
        done
        echo
    done
    
    log_info "Selection options:"
    echo "  • Enter numbers separated by spaces (e.g., 1 3 5)"
    echo "  • Type 'all' to install all servers"
    echo "  • Type 'q' to quit"
    echo
    
    echo -n "Your choice: "
    read -r selection
    
    if [[ "$selection" == "q" ]]; then
        log_warning "Installation cancelled"
        exit 0
    fi
    
    if [[ "$selection" == "all" ]]; then
        echo "${!MCP_SERVERS[@]}"
        return
    fi
    
    # Parse number selection
    local selected_servers=()
    for num in $selection; do
        if [[ "$num" =~ ^[0-9]+$ ]] && [[ -n "${server_list[num]}" ]]; then
            selected_servers+=("${server_list[num]}")
        fi
    done
    
    echo "${selected_servers[@]}"
}

install_mcp_server() {
    local server_name=$1
    local server_config="${MCP_SERVERS[$server_name]}"
    
    if [[ -z "$server_config" ]]; then
        log_error "✗ Unknown server: $server_name"
        return 1
    fi
    
    IFS='|' read -r command env_var description category extra_args target_env_var <<< "$server_config"
    
    echo
    log_info "Installing: $server_name"
    log_info "Category: $category"
    log_info "Description: $description"
    
    # Handle API key requirement
    local api_key=""
    local env_export=""
    if [[ -n "$env_var" ]]; then
        if ! api_key=$(get_api_key "$env_var" "$server_name"); then
            log_warning "✗ Skipped due to missing API key"
            return 1
        fi
        
        # Determine target environment variable name
        local target_var="${target_env_var:-$env_var}"
        env_export="$target_var=\"$api_key\""
        log_info "Environment: $target_var=***"
    fi
    
    # Build the full command
    local full_command="claude mcp add $server_name -s user"
    if [[ -n "$extra_args" ]]; then
        full_command="$full_command $extra_args"
    fi
    full_command="$full_command -- $command"
    
    log_highlight "Executing: $full_command"
    
    # Execute the installation with environment variable if needed
    if [[ -n "$env_export" ]]; then
        if env "$env_export" bash -c "$full_command"; then
            log_success "✓ Successfully installed $server_name"
            return 0
        else
            log_error "✗ Failed to install $server_name"
            return 1
        fi
    else
        if eval "$full_command"; then
            log_success "✓ Successfully installed $server_name"
            return 0
        else
            log_error "✗ Failed to install $server_name"
            return 1
        fi
    fi
}

show_help() {
    echo "AI Toolbox MCP Server Installer"
    echo
    echo "Usage:"
    echo "  $0 [options] [server1 server2 ...]"
    echo
    echo "Options:"
    echo "  --all         Install all available servers"
    echo "  --help, -h    Show this help message"
    echo
    echo "Examples:"
    echo "  $0                           # Interactive mode"
    echo "  $0 --all                     # Install all servers"
    echo "  $0 playwright fetch          # Install specific servers"
    echo
    echo "Available servers:"
    for server in $(printf '%s\n' "${!MCP_SERVERS[@]}" | sort); do
        IFS='|' read -r command env_var description category extra_args <<< "${MCP_SERVERS[$server]}"
        echo "  $server - $description"
    done
}

main() {
    local servers_to_install=()
    local install_all=false
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --all)
                install_all=true
                shift
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                if [[ -n "${MCP_SERVERS[$1]}" ]]; then
                    servers_to_install+=("$1")
                else
                    log_warning "Warning: Unknown server '$1' ignored"
                fi
                shift
                ;;
        esac
    done
    
    print_banner
    check_prerequisites
    
    # Determine which servers to install
    if [[ "$install_all" == true ]]; then
        servers_to_install=(${!MCP_SERVERS[@]})
        log_info "Installing all available servers..."
    elif [[ ${#servers_to_install[@]} -eq 0 ]]; then
        servers_to_install=($(show_server_menu))
    else
        log_info "Installing specified servers: ${servers_to_install[*]}"
    fi
    
    if [[ ${#servers_to_install[@]} -eq 0 ]]; then
        log_warning "No servers selected for installation"
        exit 0
    fi
    
    # Installation summary
    echo
    print_separator
    log_info "Installing ${#servers_to_install[@]} MCP server(s)"
    print_separator
    
    local success_count=0
    local failure_count=0
    local installed_servers=()
    local failed_servers=()
    
    for server in "${servers_to_install[@]}"; do
        if install_mcp_server "$server"; then
            ((success_count++))
            installed_servers+=("$server")
        else
            ((failure_count++))
            failed_servers+=("$server")
        fi
    done
    
    # Final summary
    echo
    print_separator
    log_info "INSTALLATION SUMMARY"
    print_separator
    log_success "✓ Successfully installed: $success_count server(s)"
    log_error "✗ Failed installations: $failure_count server(s)"
    
    if [[ ${#installed_servers[@]} -gt 0 ]]; then
        echo
        log_success "Successfully installed servers:"
        for server in "${installed_servers[@]}"; do
            echo "  • $server"
        done
    fi
    
    if [[ ${#failed_servers[@]} -gt 0 ]]; then
        echo
        log_error "Failed installations:"
        for server in "${failed_servers[@]}"; do
            echo "  • $server"
        done
    fi
    
    echo
    if [[ $success_count -gt 0 ]]; then
        log_success "🎉 Installation completed!"
        echo
        log_info "Next steps:"
        echo "  • Verify installation: claude mcp list"
        echo "  • Test a server: claude mcp test <server-name>"
        echo "  • Get help: claude --help"
    fi
    
    if [[ $failure_count -gt 0 ]]; then
        echo
        log_warning "For failed installations, check:"
        echo "  • Network connectivity"
        echo "  • API key validity"
        echo "  • Claude Code version compatibility"
        echo
        log_info "Report issues: https://github.com/krystian-ai/ai-toolbox/issues"
    fi
}

# Run main function with all arguments
main "$@"