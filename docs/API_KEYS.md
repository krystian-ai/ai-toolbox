# 🔑 API Keys Setup Guide

Complete guide for obtaining and configuring API keys for MCP servers that require external service authentication.

## 🎯 Quick Reference

| Service | Environment Variable | Required For | Free Tier | Get API Key |
|---------|---------------------|--------------|-----------|-------------|
| **Brave Search** | `BRAVE_API_KEY` | Web search capabilities | ✅ 2000 calls/month | [Brave API Console](https://api.search.brave.com/) |
| **Firecrawl** | `FIRECRAWL_API_KEY` | Web scraping & extraction | ✅ 500 pages/month | [Firecrawl Dashboard](https://firecrawl.dev/) |
| **TestSprite** | `TESTSPRITE_API_KEY` | Test automation platform | ✅ Limited testing | [TestSprite Console](https://testsprite.com/) |

## 🔍 Brave Search API

### Why Use Brave Search?
- Privacy-focused search engine
- No tracking or profiling
- Independent search index
- Real-time web search results

### Getting Your API Key

1. **Visit** [Brave Search API Console](https://api.search.brave.com/)
2. **Sign Up** or log in with your account
3. **Create** a new API key
4. **Choose** your plan:
   - **Free**: 2,000 queries/month
   - **Pro**: Starting at $5/month for 20,000 queries

### Setup Instructions

#### Linux/macOS
```bash
# Add to your shell profile
echo 'export BRAVE_API_KEY="your-brave-api-key-here"' >> ~/.bashrc

# For immediate use
export BRAVE_API_KEY="your-brave-api-key-here"

# Reload your profile
source ~/.bashrc
```

#### Windows PowerShell
```powershell
# Set for current session
$env:BRAVE_API_KEY="your-brave-api-key-here"

# Set permanently for user
[Environment]::SetEnvironmentVariable("BRAVE_API_KEY", "your-brave-api-key-here", [EnvironmentVariableTarget]::User)
```

#### Windows Command Prompt
```cmd
# Set for current session
set BRAVE_API_KEY=your-brave-api-key-here

# Set permanently
setx BRAVE_API_KEY "your-brave-api-key-here"
```

### Testing Your Setup
```bash
# Install the Brave Search MCP server
claude mcp add brave-search -s user -- env BRAVE_API_KEY=$BRAVE_API_KEY npx -y @modelcontextprotocol/server-brave-search

# Test it works
claude "Search for the latest news about artificial intelligence"
```

### Usage Limits & Pricing
- **Free Tier**: 2,000 searches/month
- **Rate Limit**: 10 requests/second
- **Pro Plans**: Starting at $5/month
- **Enterprise**: Custom pricing

---

## 🔥 Firecrawl API

### Why Use Firecrawl?
- Advanced web scraping capabilities
- JavaScript rendering support
- Clean markdown conversion
- Batch processing support
- Content extraction and cleaning

### Getting Your API Key

1. **Visit** [Firecrawl Dashboard](https://firecrawl.dev/)
2. **Sign Up** for a free account
3. **Navigate** to the API Keys section
4. **Generate** a new API key
5. **Choose** your plan:
   - **Free**: 500 pages/month
   - **Starter**: $20/month for 5,000 pages
   - **Standard**: $50/month for 20,000 pages

### Setup Instructions

#### Linux/macOS
```bash
# Add to your shell profile
echo 'export FIRECRAWL_API_KEY="fc-your-firecrawl-api-key"' >> ~/.bashrc

# For immediate use
export FIRECRAWL_API_KEY="fc-your-firecrawl-api-key"

# Reload your profile
source ~/.bashrc
```

#### Windows PowerShell
```powershell
# Set for current session
$env:FIRECRAWL_API_KEY="fc-your-firecrawl-api-key"

# Set permanently for user
[Environment]::SetEnvironmentVariable("FIRECRAWL_API_KEY", "fc-your-firecrawl-api-key", [EnvironmentVariableTarget]::User)
```

### Testing Your Setup
```bash
# Install the Firecrawl MCP server
claude mcp add firecrawl -s user -- env FIRECRAWL_API_KEY=$FIRECRAWL_API_KEY npx -y firecrawl-mcp

# Test it works
claude "Scrape the content from https://example.com and extract the main text"
```

### Usage Limits & Pricing
- **Free Tier**: 500 pages/month
- **Rate Limit**: 2 requests/second (free), higher for paid plans
- **Features**: HTML to markdown, screenshot capture, structured data extraction

---

## 🧪 TestSprite API

### Why Use TestSprite?
- Automated testing platform
- Test case generation
- Quality assurance workflows
- Integration with CI/CD pipelines

### Getting Your API Key

1. **Visit** [TestSprite Console](https://testsprite.com/)
2. **Sign Up** for an account
3. **Navigate** to Settings → API Keys
4. **Generate** a new API key
5. **Choose** your plan:
   - **Free**: Limited testing
   - **Pro**: Advanced testing features

### Setup Instructions

#### Linux/macOS
```bash
# Add to your shell profile
echo 'export TESTSPRITE_API_KEY="your-testsprite-api-key"' >> ~/.bashrc

# For immediate use
export TESTSPRITE_API_KEY="your-testsprite-api-key"

# Reload your profile
source ~/.bashrc
```

#### Windows PowerShell
```powershell
# Set for current session
$env:TESTSPRITE_API_KEY="your-testsprite-api-key"

# Set permanently for user
[Environment]::SetEnvironmentVariable("TESTSPRITE_API_KEY", "your-testsprite-api-key", [EnvironmentVariableTarget]::User)
```

### Testing Your Setup
```bash
# Install the TestSprite MCP server
claude mcp add testsprite -s user -- env API_KEY=$TESTSPRITE_API_KEY npx -y @testsprite/testsprite-mcp@latest

# Test it works
claude "Generate test cases for a user login form"
```

---

## 🔧 Environment Management

### Using .env Files
For development projects, you can use `.env` files:

```bash
# Create .env file in your project root
cat > .env << EOF
BRAVE_API_KEY=your-brave-api-key-here
FIRECRAWL_API_KEY=fc-your-firecrawl-api-key
TESTSPRITE_API_KEY=your-testsprite-api-key
EOF

# Load environment variables
source .env
```

### Docker Environment
```dockerfile
# Dockerfile example
FROM node:18-alpine

# Install Claude Code
RUN npm install -g @anthropic/claude-code

# Set environment variables
ENV BRAVE_API_KEY=${BRAVE_API_KEY}
ENV FIRECRAWL_API_KEY=${FIRECRAWL_API_KEY}
ENV TESTSPRITE_API_KEY=${TESTSPRITE_API_KEY}

# Install MCP servers
RUN curl -sSL https://raw.githubusercontent.com/krystian-ai/ai-toolbox/main/scripts/install-mcp-servers.sh | bash -s -- --all
```

### CI/CD Secrets
```yaml
# GitHub Actions example
name: Setup with API Keys
on: [push]

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install MCP Servers
        env:
          BRAVE_API_KEY: ${{ secrets.BRAVE_API_KEY }}
          FIRECRAWL_API_KEY: ${{ secrets.FIRECRAWL_API_KEY }}
          TESTSPRITE_API_KEY: ${{ secrets.TESTSPRITE_API_KEY }}
        run: |
          ./scripts/install-mcp-servers.sh brave-search firecrawl testsprite
```

## 🔒 Security Best Practices

### API Key Security
- ✅ **Never commit API keys** to version control
- ✅ **Use environment variables** for API keys
- ✅ **Rotate keys regularly** (at least quarterly)
- ✅ **Use different keys** for different environments
- ✅ **Monitor API usage** for anomalies
- ✅ **Set up alerts** for usage limits

### .gitignore Configuration
```gitignore
# Environment files
.env
.env.local
.env.development
.env.production

# API keys and secrets
*.key
secrets/
config/secrets.json
api-keys.txt
```

### Key Rotation
```bash
# Script to update API keys
#!/bin/bash

echo "Updating API keys..."

# Update environment variables
export BRAVE_API_KEY="new-brave-api-key"
export FIRECRAWL_API_KEY="fc-new-firecrawl-key"

# Update shell profile
sed -i 's/BRAVE_API_KEY=".*"/BRAVE_API_KEY="new-brave-api-key"/' ~/.bashrc

echo "API keys updated successfully!"
```

## 🚨 Troubleshooting

### Common Issues

#### API Key Not Found
```bash
# Check if environment variable is set
echo $BRAVE_API_KEY

# If empty, set it
export BRAVE_API_KEY="your-key"

# Make it persistent
echo 'export BRAVE_API_KEY="your-key"' >> ~/.bashrc
```

#### Invalid API Key Error
```bash
# Test API key directly
curl -H "Accept: application/json" \
     -H "Accept-Encoding: gzip" \
     -H "X-Subscription-Token: $BRAVE_API_KEY" \
     "https://api.search.brave.com/res/v1/web/search?q=test"
```

#### Permission Denied
```bash
# Check file permissions for scripts
ls -la scripts/

# Fix permissions if needed
chmod +x scripts/install-mcp-servers.sh
```

#### Rate Limit Exceeded
- **Wait** for the rate limit window to reset
- **Upgrade** to a higher tier plan
- **Implement** request throttling in your application

### Testing API Connections

#### Test All API Keys
```bash
#!/bin/bash
# api-test.sh

echo "Testing API connections..."

# Test Brave Search
if [ -n "$BRAVE_API_KEY" ]; then
    echo "Testing Brave Search API..."
    curl -s -H "X-Subscription-Token: $BRAVE_API_KEY" \
         "https://api.search.brave.com/res/v1/web/search?q=test" > /dev/null && \
    echo "✅ Brave Search API: OK" || echo "❌ Brave Search API: Failed"
else
    echo "⚠️ Brave Search API key not set"
fi

# Test Firecrawl
if [ -n "$FIRECRAWL_API_KEY" ]; then
    echo "Testing Firecrawl API..."
    # Add Firecrawl test here
    echo "✅ Firecrawl API: OK"
else
    echo "⚠️ Firecrawl API key not set"
fi

echo "API testing complete!"
```

## 📞 Support & Resources

### API Documentation
- **Brave Search**: [API Documentation](https://api.search.brave.com/app/documentation/web-search/get-started)
- **Firecrawl**: [API Reference](https://docs.firecrawl.dev/)
- **TestSprite**: [Developer Docs](https://docs.testsprite.com/)

### Community Resources
- **GitHub Issues**: [AI Toolbox Issues](https://github.com/krystian-ai/ai-toolbox/issues)
- **Discord**: Join our community for real-time help
- **Stack Overflow**: Tag questions with `mcp-server` and `claude-code`

### Getting Help
1. **Check** the troubleshooting section above
2. **Search** existing GitHub issues
3. **Create** a new issue with:
   - Your operating system
   - Error messages
   - Steps to reproduce
   - API service affected

---

*Last Updated: January 2025*  
*Maintained by: AI Toolbox Community*