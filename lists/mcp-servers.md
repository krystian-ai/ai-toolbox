# 🔧 Complete MCP Servers Catalog

A comprehensive list of Model Context Protocol (MCP) servers for Claude Code, organized by category and use case.

## 🌐 Web Automation & Testing

### Playwright MCP
- **Repository**: [playwright/mcp](https://github.com/microsoft/playwright)
- **Description**: Browser automation for testing and web scraping
- **Installation**: `npx @playwright/mcp@latest`
- **Use Cases**: E2E testing, web scraping, automation
- **API Key**: Not required

## 🧠 AI Enhancement

### Sequential Thinking Server
- **Repository**: [sequential-thinking-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/sequential-thinking)
- **Description**: Enhances Claude's reasoning with step-by-step thinking
- **Installation**: `npx -y @modelcontextprotocol/server-sequential-thinking`
- **Use Cases**: Complex problem solving, multi-step reasoning
- **API Key**: Not required

## 🔍 Search & Research

### Brave Search MCP
- **Repository**: [brave-search-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/brave-search)
- **Description**: Web search powered by Brave Search API
- **Installation**: `npx -y @modelcontextprotocol/server-brave-search`
- **Use Cases**: Real-time web search, research, fact-checking
- **API Key**: Required (`BRAVE_API_KEY`)
- **Get API Key**: [Brave Search API](https://api.search.brave.com/)

### Context7 MCP
- **Repository**: [context7.com](https://mcp.context7.com)
- **Description**: Context management and intelligent search
- **Installation**: SSE transport to `https://mcp.context7.com/sse`
- **Use Cases**: Context switching, project management
- **API Key**: Not required

## 🌐 Web Tools

### Fetch MCP Server
- **Repository**: [mcp-fetch](https://github.com/kazuph/mcp-fetch)
- **Description**: HTTP requests and API interactions
- **Installation**: `npx -y @kazuph/mcp-fetch`
- **Use Cases**: API testing, web requests, data fetching
- **API Key**: Not required

### Firecrawl MCP
- **Repository**: [firecrawl-mcp](https://github.com/mendableai/firecrawl)
- **Description**: Advanced web scraping and content extraction
- **Installation**: `npx -y firecrawl-mcp`
- **Use Cases**: Web scraping, content extraction, data mining
- **API Key**: Required (`FIRECRAWL_API_KEY`)
- **Get API Key**: [Firecrawl](https://firecrawl.dev/)

## 🚀 Development & Version Control

### GitHub MCP Server
- **Repository**: [github-mcp-server](https://github.com/github/github-mcp-server)
- **Description**: GitHub repository management and operations
- **Installation**: `npx -y @github/github-mcp-server`
- **Use Cases**: Repository management, issue tracking, PR automation
- **API Key**: GitHub token recommended for private repos

## 🧪 Testing & Quality Assurance

### TestSprite MCP
- **Repository**: [testsprite-mcp](https://github.com/testsprite/testsprite-mcp)
- **Description**: Test automation and validation framework
- **Installation**: `npx -y @testsprite/testsprite-mcp@latest`
- **Use Cases**: Automated testing, test case generation, QA workflows
- **API Key**: Required (`TESTSPRITE_API_KEY`)
- **Get API Key**: [TestSprite](https://testsprite.com/)

## 📊 Data & Analytics

### SQLite MCP Server
- **Repository**: [sqlite-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/sqlite)
- **Description**: SQLite database operations and queries
- **Installation**: `npx -y @modelcontextprotocol/server-sqlite`
- **Use Cases**: Database queries, data analysis, local data storage
- **API Key**: Not required

### Postgres MCP Server
- **Repository**: [postgres-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/postgres)
- **Description**: PostgreSQL database operations
- **Installation**: `npx -y @modelcontextprotocol/server-postgres`
- **Use Cases**: Enterprise database operations, complex queries
- **API Key**: Database credentials required

## 🗂️ File & System Operations

### Filesystem MCP Server
- **Repository**: [filesystem-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)
- **Description**: File system operations and management
- **Installation**: `npx -y @modelcontextprotocol/server-filesystem`
- **Use Cases**: File operations, directory management, file search
- **API Key**: Not required

### Git MCP Server
- **Repository**: [git-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/git)
- **Description**: Git repository operations
- **Installation**: `npx -y @modelcontextprotocol/server-git`
- **Use Cases**: Version control, repository management, commit operations
- **API Key**: Not required

## 🔧 System & Infrastructure

### Docker MCP Server
- **Repository**: [docker-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/docker)
- **Description**: Docker container management
- **Installation**: `npx -y @modelcontextprotocol/server-docker`
- **Use Cases**: Container orchestration, deployment automation
- **API Key**: Not required

### Kubernetes MCP Server
- **Repository**: [k8s-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/kubernetes)
- **Description**: Kubernetes cluster management
- **Installation**: `npx -y @modelcontextprotocol/server-kubernetes`
- **Use Cases**: K8s operations, pod management, deployments
- **API Key**: Cluster credentials required

## 📱 Communication & Collaboration

### Slack MCP Server
- **Repository**: [slack-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/slack)
- **Description**: Slack workspace integration
- **Installation**: `npx -y @modelcontextprotocol/server-slack`
- **Use Cases**: Message automation, workflow integration
- **API Key**: Required (Slack Bot Token)

### Discord MCP Server
- **Repository**: [discord-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/discord)
- **Description**: Discord server management
- **Installation**: `npx -y @modelcontextprotocol/server-discord`
- **Use Cases**: Bot automation, server management
- **API Key**: Required (Discord Bot Token)

## 🧮 Specialized Tools

### Memory MCP Server
- **Repository**: [memory-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)
- **Description**: Persistent memory and context storage
- **Installation**: `npx -y @modelcontextprotocol/server-memory`
- **Use Cases**: Long-term memory, context persistence
- **API Key**: Not required

### Time MCP Server
- **Repository**: [time-mcp](https://github.com/modelcontextprotocol/servers/tree/main/src/time)
- **Description**: Date, time, and scheduling operations
- **Installation**: `npx -y @modelcontextprotocol/server-time`
- **Use Cases**: Date calculations, scheduling, timezone handling
- **API Key**: Not required

## 🎯 Installation Categories

### 🟢 No API Key Required
Perfect for quick setup and testing:
- playwright
- sequential-thinking  
- fetch
- github (public repos)
- filesystem
- git
- memory
- time

### 🟡 API Key Recommended
Enhanced functionality with API keys:
- github (private repos)
- docker (remote registries)
- kubernetes (cluster access)

### 🔴 API Key Required
Requires external service authentication:
- brave-search
- firecrawl
- testsprite
- slack
- discord
- postgres (database credentials)

## 📋 Quick Installation Commands

### Essential Development Stack
```bash
# Core development tools
claude mcp add playwright -s user -- npx @playwright/mcp@latest
claude mcp add fetch -s user -- npx -y @kazuph/mcp-fetch
claude mcp add github -s user -- npx -y @github/github-mcp-server
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem
claude mcp add git -s user -- npx -y @modelcontextprotocol/server-git
```

### AI Enhancement Pack
```bash
# Boost Claude's capabilities
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory
claude mcp add context7 --transport sse -s user -- https://mcp.context7.com/sse
```

### Web Research & Scraping
```bash
# Requires API keys
claude mcp add brave-search -s user -- env BRAVE_API_KEY=your-key npx -y @modelcontextprotocol/server-brave-search
claude mcp add firecrawl -s user -- env FIRECRAWL_API_KEY=fc-your-key npx -y firecrawl-mcp
```

## 🤝 Contributing

Found a new MCP server? Help us grow the catalog:

1. **Fork** the repository
2. **Add** the server to this list with complete details
3. **Test** the installation command
4. **Submit** a pull request

### Server Information Template
```markdown
### Server Name MCP
- **Repository**: [link-to-repo](https://github.com/...)
- **Description**: Brief description of functionality
- **Installation**: Complete installation command
- **Use Cases**: Comma-separated use cases
- **API Key**: Required/Not required (+ environment variable name)
- **Get API Key**: [service-name](https://service-url) (if applicable)
```

---

**Total Servers**: 20+  
**Last Updated**: January 2025  
**Maintained By**: AI Toolbox Community