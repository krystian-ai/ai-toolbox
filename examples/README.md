# 📚 Usage Examples

Real-world examples and use cases for AI Toolbox scripts and tools.

## 🚀 MCP Server Installation Examples

### Basic Usage

#### Install Single Server
```bash
# Linux/macOS
./scripts/install-mcp-servers.sh playwright

# Windows PowerShell
.\scripts\install-mcp-servers.ps1 -Servers "playwright"
```

#### Install Multiple Servers
```bash
# Linux/macOS
./scripts/install-mcp-servers.sh playwright fetch sequential-thinking

# Windows PowerShell  
.\scripts\install-mcp-servers.ps1 -Servers "playwright","fetch","sequential-thinking"
```

#### Install All Servers
```bash
# Linux/macOS
./scripts/install-mcp-servers.sh --all

# Windows PowerShell
.\scripts\install-mcp-servers.ps1 -All
```

### Advanced Usage

#### Silent Installation (Windows)
```powershell
# Install without interactive prompts
.\scripts\install-mcp-servers.ps1 -All -Silent
```

#### With Environment Variables
```bash
# Set API keys before installation
export BRAVE_API_KEY="your-brave-api-key"
export FIRECRAWL_API_KEY="fc-your-firecrawl-key"

# Then install
./scripts/install-mcp-servers.sh brave-search firecrawl
```

## 🎯 Use Case Scenarios

### Web Development Stack
Perfect for full-stack web developers:

```bash
# Install web development essentials
./scripts/install-mcp-servers.sh playwright fetch github

# Verify installation
claude mcp list

# Test browser automation
claude mcp test playwright
```

**What you get**:
- Browser automation for testing
- HTTP requests for API development  
- GitHub integration for version control

### AI-Enhanced Development
Boost your coding with AI capabilities:

```bash
# Install AI enhancement servers
./scripts/install-mcp-servers.sh sequential-thinking context7

# Use with Claude Code for better reasoning
claude --model claude-3-sonnet "Help me architect a microservices solution"
```

**Benefits**:
- Enhanced reasoning capabilities
- Better context management
- More thoughtful code suggestions

### Research & Data Collection
For data scientists and researchers:

```bash
# Set up API keys
export BRAVE_API_KEY="your-key"
export FIRECRAWL_API_KEY="fc-your-key"

# Install research tools
./scripts/install-mcp-servers.sh brave-search firecrawl fetch

# Use for research automation
claude "Research the latest trends in machine learning and summarize key findings"
```

**Capabilities**:
- Web search for latest information
- Content extraction from websites
- Data fetching from APIs

### Testing & Quality Assurance
For QA engineers and testers:

```bash
# Install testing stack
./scripts/install-mcp-servers.sh playwright testsprite

# Set up TestSprite if needed
export TESTSPRITE_API_KEY="your-testsprite-key"
```

**Features**:
- Automated browser testing
- Test case generation
- Quality validation workflows

## 🔧 Integration Examples

### CI/CD Pipeline Integration

#### GitHub Actions Example
```yaml
name: Setup MCP Servers
on: [push, pull_request]

jobs:
  setup-mcp:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          
      - name: Install Claude Code
        run: npm install -g @anthropic/claude-code
        
      - name: Install MCP Servers
        run: |
          curl -sSL https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.sh | bash -s -- playwright fetch
        env:
          BRAVE_API_KEY: ${{ secrets.BRAVE_API_KEY }}
          
      - name: Verify Installation
        run: claude mcp list
```

#### Docker Example
```dockerfile
FROM node:18-alpine

# Install Claude Code
RUN npm install -g @anthropic/claude-code

# Copy and run MCP installer
COPY scripts/install-mcp-servers.sh /tmp/
RUN chmod +x /tmp/install-mcp-servers.sh && \
    /tmp/install-mcp-servers.sh --all

# Verify installation
RUN claude mcp list

WORKDIR /app
COPY . .

CMD ["node", "app.js"]
```

### Development Workflow Integration

#### VS Code Tasks Example
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Install MCP Servers",
      "type": "shell",
      "command": "./scripts/install-mcp-servers.sh",
      "args": ["playwright", "fetch", "sequential-thinking"],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared"
      },
      "problemMatcher": []
    },
    {
      "label": "Verify MCP Installation",
      "type": "shell", 
      "command": "claude",
      "args": ["mcp", "list"],
      "group": "test",
      "dependsOn": "Install MCP Servers"
    }
  ]
}
```

## 🛠️ Troubleshooting Examples

### Common Installation Issues

#### Issue: Claude Command Not Found
```bash
# Check if Claude is installed
which claude

# If not found, install it
npm install -g @anthropic/claude-code

# Verify installation
claude --version
```

#### Issue: API Key Problems
```bash
# Check environment variables
echo $BRAVE_API_KEY
echo $FIRECRAWL_API_KEY

# Set temporarily for testing
export BRAVE_API_KEY="test-key"

# Make persistent (Linux/macOS)
echo 'export BRAVE_API_KEY="your-key"' >> ~/.bashrc
source ~/.bashrc
```

#### Issue: Permission Denied (Linux/macOS)
```bash
# Make script executable
chmod +x scripts/install-mcp-servers.sh

# Or run with bash directly
bash scripts/install-mcp-servers.sh
```

#### Issue: PowerShell Execution Policy (Windows)
```powershell
# Check current policy
Get-ExecutionPolicy

# Set policy to allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Run script
.\scripts\install-mcp-servers.ps1
```

### Verification Commands

#### Check MCP Server Status
```bash
# List all installed servers
claude mcp list

# Test specific server
claude mcp test playwright

# Get server details
claude mcp info sequential-thinking

# Check server logs
claude mcp logs fetch
```

## 📊 Performance Examples

### Installation Benchmarks

#### Single Server Installation
- **Playwright**: ~30 seconds (first time, ~10s cached)
- **Sequential Thinking**: ~15 seconds  
- **Fetch**: ~10 seconds
- **GitHub**: ~20 seconds

#### Batch Installation
- **All servers**: ~3-5 minutes (depending on network)
- **Web stack** (3 servers): ~1-2 minutes
- **AI stack** (2 servers): ~45 seconds

#### API Key Setup
- **Interactive prompt**: ~30 seconds per key
- **Environment variables**: Instant
- **Persistent storage**: +10 seconds

### Optimization Tips

#### Faster Installation
```bash
# Pre-set API keys to avoid prompts
export BRAVE_API_KEY="your-key"
export FIRECRAWL_API_KEY="fc-your-key"
export TESTSPRITE_API_KEY="your-key"

# Install in parallel (advanced)
./scripts/install-mcp-servers.sh playwright &
./scripts/install-mcp-servers.sh fetch &
wait
```

#### Batch Operations
```bash
# Create installation script for your team
cat > team-setup.sh << EOF
#!/bin/bash
export BRAVE_API_KEY="team-api-key"
./scripts/install-mcp-servers.sh playwright fetch brave-search sequential-thinking
EOF

chmod +x team-setup.sh
```

## 🎓 Learning Examples

### For Beginners
Start with simple servers that don't require API keys:

```bash
# Step 1: Install basic servers
./scripts/install-mcp-servers.sh fetch sequential-thinking

# Step 2: Verify they work
claude mcp list

# Step 3: Try them out
claude "Use the fetch server to get data from a public API"
```

### For Advanced Users
Set up a complete development environment:

```bash
# Full development stack
export BRAVE_API_KEY="your-brave-key"
export FIRECRAWL_API_KEY="fc-your-firecrawl-key"
export TESTSPRITE_API_KEY="your-testsprite-key"

# Install everything
./scripts/install-mcp-servers.sh --all

# Create development aliases
echo 'alias mcp-status="claude mcp list"' >> ~/.bashrc
echo 'alias mcp-test="claude mcp test"' >> ~/.bashrc
```

---

## 🤝 Contributing Examples

Have a cool use case? Share it with the community:

1. **Document** your use case with clear examples
2. **Test** the examples thoroughly  
3. **Add** to this file or create new example files
4. **Submit** a pull request

### Example Template
```markdown
### Your Use Case Title
Brief description of the scenario and benefits.

```bash
# Installation commands
./scripts/install-mcp-servers.sh server1 server2

# Usage examples
claude "your example command"
```

**What you get**:
- Benefit 1
- Benefit 2
- Benefit 3

**Best for**: Target audience description
```

---

*Last Updated: January 2025*  
*Maintained by: AI Toolbox Community*