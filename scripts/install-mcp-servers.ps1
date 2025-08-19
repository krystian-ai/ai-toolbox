# MCP Servers Installation Script for Windows PowerShell
# AI Toolbox - One-command installation for MCP servers
# Usage: iex (irm https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.ps1)

param(
    [switch]$All,
    [string[]]$Servers,
    [switch]$Silent
)

# MCP Server Configurations
$MCPServers = @{
    "playwright" = @{
        Command = "npx @playwright/mcp@latest"
        EnvVar = ""
        Description = "Browser automation and web testing"
        Category = "Web Automation"
    }
    "context7" = @{
        Command = "https://mcp.context7.com/sse"
        EnvVar = ""
        Description = "Context management and search"
        Category = "Productivity"
        ExtraArgs = "--transport sse"
    }
    "testsprite" = @{
        Command = "env API_KEY=API_KEY_PLACEHOLDER npx -y @testsprite/testsprite-mcp@latest"
        EnvVar = "TESTSPRITE_API_KEY"
        Description = "Test automation and validation"
        Category = "Testing"
    }
    "sequential-thinking" = @{
        Command = "npx -y @modelcontextprotocol/server-sequential-thinking"
        EnvVar = ""
        Description = "Sequential thinking and reasoning"
        Category = "AI Enhancement"
    }
    "fetch" = @{
        Command = "npx -y @kazuph/mcp-fetch"
        EnvVar = ""
        Description = "HTTP fetch and web requests"
        Category = "Web Tools"
    }
    "brave-search" = @{
        Command = "env BRAVE_API_KEY=API_KEY_PLACEHOLDER npx -y @modelcontextprotocol/server-brave-search"
        EnvVar = "BRAVE_API_KEY"
        Description = "Web search using Brave Search API"
        Category = "Search"
    }
    "firecrawl" = @{
        Command = "env FIRECRAWL_API_KEY=API_KEY_PLACEHOLDER npx -y firecrawl-mcp"
        EnvVar = "FIRECRAWL_API_KEY"
        Description = "Web scraping and content extraction"
        Category = "Web Tools"
    }
    "github" = @{
        Command = "npx -y @github/github-mcp-server"
        EnvVar = ""
        Description = "GitHub repository management"
        Category = "Development"
    }
}

function Write-StyledText {
    param(
        [string]$Text,
        [string]$Style = "Normal"
    )
    
    switch ($Style) {
        "Title" { Write-Host $Text -ForegroundColor Blue }
        "Success" { Write-Host $Text -ForegroundColor Green }
        "Error" { Write-Host $Text -ForegroundColor Red }
        "Warning" { Write-Host $Text -ForegroundColor Yellow }
        "Info" { Write-Host $Text -ForegroundColor Cyan }
        "Highlight" { Write-Host $Text -ForegroundColor Magenta }
        default { Write-Host $Text }
    }
}

function Show-Banner {
    Write-Host ""
    Write-StyledText "============================================================" "Title"
    Write-StyledText "                AI Toolbox - MCP Server Installer" "Title"
    Write-StyledText "    One-command installation for Claude Code MCP servers" "Info"
    Write-StyledText "============================================================" "Title"
    Write-Host ""
}

function Test-Prerequisites {
    Write-StyledText "Checking prerequisites..." "Info"
    
    # Check Claude Code CLI
    try {
        $null = Get-Command claude -ErrorAction Stop
        Write-StyledText "✓ Claude Code CLI found" "Success"
    }
    catch {
        Write-StyledText "✗ Claude Code CLI not found!" "Error"
        Write-StyledText "Install it with: npm install -g @anthropic/claude-code" "Warning"
        Write-StyledText "Or visit: https://docs.anthropic.com/en/docs/claude-code/setup" "Info"
        exit 1
    }
    
    # Check Node.js/npx
    try {
        $null = Get-Command npx -ErrorAction Stop
        Write-StyledText "✓ Node.js/npx found" "Success"
    }
    catch {
        Write-StyledText "✗ Node.js not found!" "Error"
        Write-StyledText "Download from: https://nodejs.org/" "Info"
        exit 1
    }
    
    Write-Host ""
}

function Get-APIKey {
    param(
        [string]$EnvVarName,
        [string]$ServerName,
        [string]$Instructions = ""
    )
    
    # Check environment variables (User and Machine)
    $apiKey = [Environment]::GetEnvironmentVariable($EnvVarName, [EnvironmentVariableTarget]::User)
    if (-not $apiKey) {
        $apiKey = [Environment]::GetEnvironmentVariable($EnvVarName, [EnvironmentVariableTarget]::Machine)
    }
    
    if ($apiKey) {
        Write-StyledText "✓ Found $ServerName API key in environment ($EnvVarName)" "Success"
        return $apiKey
    }
    
    # Prompt for API key
    Write-StyledText "⚠ $ServerName requires an API key" "Warning"
    if ($Instructions) {
        Write-StyledText "Instructions: $Instructions" "Info"
    }
    
    $key = Read-Host "Enter your $EnvVarName API key (or press Enter to skip)"
    
    if (-not $key) {
        Write-StyledText "Skipping $ServerName installation" "Warning"
        return $null
    }
    
    # Offer to save the API key
    $saveChoice = Read-Host "Save this API key to your environment variables? (y/N)"
    if ($saveChoice -match "^[Yy]") {
        try {
            [Environment]::SetEnvironmentVariable($EnvVarName, $key, [EnvironmentVariableTarget]::User)
            Write-StyledText "✓ API key saved to user environment variables" "Success"
        }
        catch {
            Write-StyledText "⚠ Could not save API key: $($_.Exception.Message)" "Warning"
        }
    }
    
    return $key
}

function Show-ServerMenu {
    Write-StyledText "Available MCP Servers:" "Title"
    Write-Host ""
    
    # Group servers by category
    $grouped = $MCPServers.GetEnumerator() | Group-Object { $_.Value.Category } | Sort-Object Name
    
    $serverIndex = 1
    $serverList = @()
    
    foreach ($group in $grouped) {
        Write-StyledText "[$($group.Name)]" "Highlight"
        foreach ($server in ($group.Group | Sort-Object Name)) {
            $serverList += $server.Name
            $apiRequired = if ($server.Value.EnvVar) { " (API key required)" } else { "" }
            Write-Host "  $serverIndex) $($server.Name)$apiRequired"
            Write-Host "     $($server.Value.Description)" -ForegroundColor Gray
            $serverIndex++
        }
        Write-Host ""
    }
    
    Write-StyledText "Selection options:" "Info"
    Write-Host "  • Enter numbers separated by spaces (e.g., 1 3 5)"
    Write-Host "  • Type 'all' to install all servers"
    Write-Host "  • Type 'q' to quit"
    Write-Host ""
    
    $selection = Read-Host "Your choice"
    
    if ($selection -eq "q") {
        Write-StyledText "Installation cancelled" "Warning"
        exit 0
    }
    
    if ($selection -eq "all") {
        return $serverList
    }
    
    # Parse number selection
    $selectedServers = @()
    $numbers = $selection -split '\s+'
    foreach ($num in $numbers) {
        if ($num -match '^\d+$') {
            $index = [int]$num - 1
            if ($index -ge 0 -and $index -lt $serverList.Count) {
                $selectedServers += $serverList[$index]
            }
        }
    }
    
    return $selectedServers
}

function Install-MCPServer {
    param([string]$ServerName)
    
    $config = $MCPServers[$ServerName]
    if (-not $config) {
        Write-StyledText "✗ Unknown server: $ServerName" "Error"
        return $false
    }
    
    Write-Host ""
    Write-StyledText "Installing: $ServerName" "Title"
    Write-StyledText "Category: $($config.Category)" "Info"
    Write-StyledText "Description: $($config.Description)" "Info"
    
    $command = $config.Command
    
    # Handle API key requirement
    if ($config.EnvVar) {
        $apiKey = Get-APIKey -EnvVarName $config.EnvVar -ServerName $ServerName
        if (-not $apiKey) {
            Write-StyledText "✗ Skipped due to missing API key" "Warning"
            return $false
        }
        $command = $command -replace "API_KEY_PLACEHOLDER", $apiKey
    }
    
    # Build the full command
    $fullCommand = "claude mcp add $ServerName -s user"
    if ($config.ExtraArgs) {
        $fullCommand += " $($config.ExtraArgs)"
    }
    $fullCommand += " -- $command"
    
    Write-StyledText "Executing: $fullCommand" "Highlight"
    
    # Execute the installation
    try {
        $output = cmd /c $fullCommand 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-StyledText "✓ Successfully installed $ServerName" "Success"
            return $true
        }
        else {
            Write-StyledText "✗ Failed to install $ServerName" "Error"
            Write-Host "Error details: $output" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-StyledText "✗ Installation failed: $($_.Exception.Message)" "Error"
        return $false
    }
}

# Main execution flow
function Main {
    Show-Banner
    Test-Prerequisites
    
    # Determine which servers to install
    if ($All) {
        $serversToInstall = @($MCPServers.Keys)
        Write-StyledText "Installing all available servers..." "Info"
    }
    elseif ($Servers) {
        $serversToInstall = $Servers
        Write-StyledText "Installing specified servers: $($Servers -join ', ')" "Info"
    }
    else {
        $serversToInstall = Show-ServerMenu
    }
    
    if (-not $serversToInstall -or $serversToInstall.Count -eq 0) {
        Write-StyledText "No servers selected for installation" "Warning"
        exit 0
    }
    
    # Installation summary
    Write-Host ""
    Write-StyledText "================================================" "Title"
    Write-StyledText "Installing $($serversToInstall.Count) MCP server(s)" "Title"
    Write-StyledText "================================================" "Title"
    
    $successCount = 0
    $failureCount = 0
    $installedServers = @()
    $failedServers = @()
    
    foreach ($server in $serversToInstall) {
        if (Install-MCPServer -ServerName $server) {
            $successCount++
            $installedServers += $server
        }
        else {
            $failureCount++
            $failedServers += $server
        }
    }
    
    # Final summary
    Write-Host ""
    Write-StyledText "================================================" "Title"
    Write-StyledText "INSTALLATION SUMMARY" "Title"
    Write-StyledText "================================================" "Title"
    Write-StyledText "✓ Successfully installed: $successCount server(s)" "Success"
    Write-StyledText "✗ Failed installations: $failureCount server(s)" "Error"
    
    if ($installedServers.Count -gt 0) {
        Write-Host ""
        Write-StyledText "Successfully installed servers:" "Success"
        foreach ($server in $installedServers) {
            Write-Host "  • $server" -ForegroundColor Green
        }
    }
    
    if ($failedServers.Count -gt 0) {
        Write-Host ""
        Write-StyledText "Failed installations:" "Error"
        foreach ($server in $failedServers) {
            Write-Host "  • $server" -ForegroundColor Red
        }
    }
    
    Write-Host ""
    if ($successCount -gt 0) {
        Write-StyledText "🎉 Installation completed!" "Success"
        Write-Host ""
        Write-StyledText "Next steps:" "Info"
        Write-Host "  • Verify installation: " -NoNewline
        Write-StyledText "claude mcp list" "Highlight"
        Write-Host "  • Test a server: " -NoNewline
        Write-StyledText "claude mcp test <server-name>" "Highlight"
        Write-Host "  • Get help: " -NoNewline
        Write-StyledText "claude --help" "Highlight"
    }
    
    if ($failureCount -gt 0) {
        Write-Host ""
        Write-StyledText "For failed installations, check:" "Warning"
        Write-Host "  • Network connectivity"
        Write-Host "  • API key validity"
        Write-Host "  • Claude Code version compatibility"
        Write-Host ""
        Write-StyledText "Report issues: https://github.com/krystian-ai/ai-toolbox/issues" "Info"
    }
}

# Run the main function
if ($MyInvocation.InvocationName -ne '.') {
    Main
}