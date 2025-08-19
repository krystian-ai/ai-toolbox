# 🚀 AI Toolbox

**Scripts and tools to kickstart AI projects with one command. Quickly install MCP servers, sub-agents, and dependencies on Windows, Linux, or macOS.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-blue.svg)](https://github.com/krystian-ai/ai-toolbox)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-green.svg)](https://docs.anthropic.com/en/docs/claude-code)

> Transform your development workflow with AI-powered tools and automation. From MCP server installation to curated prompts, everything you need to get started with AI-enhanced coding.

## ✨ Features

- **🔧 One-Command Installation** - Install MCP servers with a single command
- **🌐 Cross-Platform Support** - Works on Windows, Linux, and macOS
- **🔑 Smart API Key Management** - Automatic detection and secure storage
- **📋 Curated Server Lists** - Hand-picked MCP servers for different use cases
- **🎯 Interactive Menus** - User-friendly server selection
- **📊 Installation Tracking** - Success/failure reporting with detailed logs
- **🔍 Category-Based Organization** - Servers grouped by functionality

## 🚀 Quick Start

### Windows (PowerShell)
```powershell
iex (irm https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.ps1)
```

### Linux/macOS (Bash)
```bash
curl -sSL https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.sh | bash
```

### Manual Installation
```bash
# Download and run
wget https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.sh
chmod +x install-mcp-servers.sh
./install-mcp-servers.sh
```

## 📦 Available MCP Servers

### 🌐 Web Automation
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **playwright** | Browser automation and web testing | ❌ |

### 🧠 AI Enhancement  
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **sequential-thinking** | Sequential thinking and reasoning capabilities | ❌ |

### 🔍 Search & Research
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **brave-search** | Web search using Brave Search API | ✅ `BRAVE_API_KEY` |

### 🌐 Web Tools
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **fetch** | HTTP fetch and web requests | ❌ |
| **firecrawl** | Web scraping and content extraction | ✅ `FIRECRAWL_API_KEY` |

### 🚀 Development
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **github** | GitHub repository management | ❌ |

### ⚡ Productivity
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **context7** | Context management and search | ❌ |

### 🧪 Testing
| Server | Description | API Key Required |
|--------|-------------|------------------|
| **testsprite** | Test automation and validation | ✅ `TESTSPRITE_API_KEY` |

## 🔧 Advanced Usage

### Install Specific Servers
```bash
# Linux/macOS
./install-mcp-servers.sh playwright fetch github

# Windows PowerShell  
.\install-mcp-servers.ps1 -Servers "playwright","fetch","github"
```

### Install All Servers
```bash
# Linux/macOS
./install-mcp-servers.sh --all

# Windows PowerShell
.\install-mcp-servers.ps1 -All
```

### Silent Installation
```powershell
# Windows only
.\install-mcp-servers.ps1 -All -Silent
```

## 🔑 API Key Setup

### Required API Keys

#### Brave Search API
1. Visit [Brave Search API](https://api.search.brave.com/)
2. Sign up and get your API key
3. Set environment variable:
   ```bash
   # Linux/macOS
   export BRAVE_API_KEY="your-brave-api-key"
   
   # Windows
   $env:BRAVE_API_KEY="your-brave-api-key"
   ```

#### Firecrawl API
1. Visit [Firecrawl](https://firecrawl.dev/)
2. Sign up and get your API key
3. Set environment variable:
   ```bash
   # Linux/macOS
   export FIRECRAWL_API_KEY="fc-your-api-key"
   
   # Windows
   $env:FIRECRAWL_API_KEY="fc-your-api-key"
   ```

#### TestSprite API
1. Visit [TestSprite](https://testsprite.com/)
2. Sign up and get your API key
3. Set environment variable:
   ```bash
   # Linux/macOS
   export TESTSPRITE_API_KEY="your-testsprite-api-key"
   
   # Windows
   $env:TESTSPRITE_API_KEY="your-testsprite-api-key"
   ```

## 📋 Prerequisites

### All Platforms
- **Claude Code CLI**: `npm install -g @anthropic/claude-code`
- **Node.js and npm**: [nodejs.org](https://nodejs.org/)

### Linux/macOS Additional (Optional)
- **Interactive menus**: Script works with basic terminal
- **Enhanced UI**: Install `dialog` or `whiptail` for better terminal UI

### Verification
After installation, verify your MCP servers:
```bash
claude mcp list
claude mcp test <server-name>
```

## 📁 Repository Structure

```
ai-toolbox/
├── scripts/                    # Installation scripts
│   ├── install-mcp-servers.ps1 # Windows PowerShell installer
│   └── install-mcp-servers.sh  # Linux/macOS bash installer
├── lists/                      # Curated lists
│   ├── mcp-servers.md          # Complete MCP servers catalog
│   └── sub-agents.md           # Claude Code sub-agents
├── prompts/                    # Ready-to-use prompts
│   ├── claude-code/            # Claude Code specific prompts
│   └── general/                # General AI prompts
├── examples/                   # Usage examples
├── docs/                       # Documentation
└── README.md                   # This file
```

## 🚨 Troubleshooting

### Common Issues

#### "claude: command not found"
```bash
# Install Claude Code CLI
npm install -g @anthropic/claude-code

# Verify installation
claude --version
```

#### "npx: command not found"
Install Node.js from [nodejs.org](https://nodejs.org/) or use your package manager:
```bash
# Ubuntu/Debian
sudo apt install nodejs npm

# macOS (with Homebrew)
brew install node

# Windows: Download from https://nodejs.org/
```

#### API Key Not Working
1. Check environment variable name matches exactly
2. Ensure no extra spaces or quotes
3. Restart terminal after setting environment variables
4. For Windows: Check both User and System environment variables

#### Permission Denied (Linux/macOS)
```bash
# Make script executable
chmod +x install-mcp-servers.sh

# Or run with bash directly  
bash install-mcp-servers.sh
```

### Getting Help
- 📚 [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- 🔧 Check MCP server status: `claude mcp list`
- 🧪 Test individual servers: `claude mcp test <server-name>`
- 🆘 Get help: `claude --help`

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Add new MCP servers** - Submit PRs with new server configurations
2. **Improve documentation** - Help make our docs clearer and more comprehensive  
3. **Report issues** - Found a bug? Let us know!
4. **Share prompts** - Add useful prompts to the prompts/ directory
5. **Platform testing** - Test on different OS versions and configurations

### Development Setup
```bash
git clone https://github.com/krystian-ai/ai-toolbox.git
cd ai-toolbox
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🌟 Support

- ⭐ Star this repository if you find it helpful
- 🐛 [Report issues](https://github.com/krystian-ai/ai-toolbox/issues)
- 💡 [Suggest features](https://github.com/krystian-ai/ai-toolbox/issues)
- 📖 [Read the docs](https://github.com/krystian-ai/ai-toolbox/wiki)

## 🚀 What's Next?

- 🔄 Auto-update mechanism for MCP servers
- 🎯 Claude Code sub-agent installer
- 📱 Mobile-friendly web interface
- 🔧 Configuration management tools
- 📊 Usage analytics and recommendations

---

**Made with ❤️ for the AI development community**

*Streamline your AI workflow and focus on what matters - building amazing applications.*