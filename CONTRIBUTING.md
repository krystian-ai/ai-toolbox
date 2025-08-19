# Contributing to AI Toolbox

Thank you for your interest in contributing to AI Toolbox! We welcome contributions from the community to make this project even better.

## 🤝 Ways to Contribute

### 1. Add New MCP Servers
Have a useful MCP server? Add it to our collection:

1. **Edit the configuration** in both installation scripts:
   - `scripts/install-mcp-servers.ps1` (Windows)
   - `scripts/install-mcp-servers.sh` (Linux/macOS)

2. **Follow the format**:
   ```bash
   # Bash format
   ["server-name"]="command|env_var|description|category|extra_args"
   
   # PowerShell format
   "server-name" = @{
       Command = "command"
       EnvVar = "ENV_VAR_NAME"
       Description = "Description"
       Category = "Category"
       ExtraArgs = "--optional-args"
   }
   ```

3. **Update documentation** in README.md

### 2. Improve Documentation
- Fix typos and grammar
- Add more detailed examples
- Improve troubleshooting sections
- Translate to other languages

### 3. Add Useful Prompts
Share prompts in the `prompts/` directory:

- `prompts/claude-code/` - Claude Code specific prompts
- `prompts/general/` - General AI prompts

### 4. Report Issues
Found a bug? Please report it:

1. Check existing issues first
2. Use our issue template
3. Include system information
4. Provide reproduction steps

### 5. Suggest Features
Have an idea? We'd love to hear it:

1. Open a feature request issue
2. Describe the use case
3. Explain the expected behavior

## 📝 Contribution Guidelines

### Code Style
- **Shell scripts**: Follow bash best practices
- **PowerShell**: Use approved verbs and proper formatting
- **Documentation**: Use clear, concise language
- **Comments**: Explain complex logic

### Testing
- Test on multiple platforms when possible
- Verify installations work correctly
- Check API key handling
- Test error scenarios

### Commit Messages
Use clear, descriptive commit messages:
```
Add support for new-server MCP server

- Add configuration for new-server
- Update documentation
- Add API key handling for NEW_SERVER_API_KEY
```

### Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/your-feature-name`
3. **Make** your changes
4. **Test** thoroughly
5. **Commit** with clear messages
6. **Push** to your fork: `git push origin feature/your-feature-name`
7. **Submit** a pull request

### Pull Request Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature  
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] Tested on Windows
- [ ] Tested on Linux/macOS
- [ ] Added/updated tests
- [ ] Documentation updated

## Screenshots (if applicable)
Add screenshots here
```

## 🧪 Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/krystian-ai/ai-toolbox.git
   cd ai-toolbox
   ```

2. **Test locally**:
   ```bash
   # Linux/macOS
   ./scripts/install-mcp-servers.sh --help
   
   # Windows
   .\scripts\install-mcp-servers.ps1 -Help
   ```

3. **Verify scripts work**:
   - Test installation flow
   - Check API key handling  
   - Verify error handling

## 📋 Server Addition Checklist

When adding a new MCP server:

- [ ] Added to both PowerShell and Bash scripts
- [ ] Correct command format
- [ ] API key handling (if required)
- [ ] Appropriate category assignment
- [ ] Updated README.md server table
- [ ] Tested installation locally
- [ ] Added any required environment variables
- [ ] Documentation for API key setup (if needed)

## 🔒 Security Considerations

- **Never commit API keys** or secrets
- **Validate user input** in scripts
- **Use secure methods** for API key storage
- **Follow principle of least privilege**

## 💡 Ideas for Contributions

### High Priority
- [ ] Add more popular MCP servers
- [ ] Improve error handling
- [ ] Add logging functionality
- [ ] Create web-based installer

### Medium Priority  
- [ ] Add sub-agent installer
- [ ] Configuration file support
- [ ] Auto-update mechanism
- [ ] Usage analytics (privacy-focused)

### Nice to Have
- [ ] GUI installer
- [ ] Docker support
- [ ] CI/CD integration examples
- [ ] Performance optimizations

## 📞 Getting Help

- **Issues**: Use GitHub issues for bugs and features
- **Discussions**: Use GitHub discussions for questions
- **Email**: For security issues, contact directly

## 🙏 Recognition

Contributors will be:
- Listed in our contributors section
- Mentioned in release notes
- Given credit for their contributions

## 📄 Code of Conduct

Please be respectful and professional in all interactions. We aim to create a welcoming environment for all contributors.

---

Thank you for helping make AI Toolbox better for everyone! 🚀