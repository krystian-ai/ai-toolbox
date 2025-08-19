# 🎯 Claude Code Prompts Collection

Ready-to-use prompts specifically designed for Claude Code to enhance your development workflow and AI interactions.

## 📋 Categories

### 🏗️ Architecture & Design
- [System Architecture Review](#system-architecture-review)
- [API Design Guidelines](#api-design-guidelines)
- [Database Schema Design](#database-schema-design)

### 🐛 Code Review & Quality
- [Code Review Checklist](#code-review-checklist)
- [Performance Optimization](#performance-optimization)
- [Security Audit](#security-audit)

### 📚 Documentation
- [API Documentation Generator](#api-documentation-generator)
- [README Generator](#readme-generator)
- [Code Comments Generator](#code-comments-generator)

### 🧪 Testing
- [Test Case Generator](#test-case-generator)
- [Bug Reproduction Steps](#bug-reproduction-steps)

---

## 🏗️ Architecture & Design

### System Architecture Review
```
Please review this codebase architecture and provide recommendations for:

1. **Design Patterns**: Identify which patterns are used and suggest improvements
2. **SOLID Principles**: Check adherence and highlight violations
3. **Scalability**: Assess current scalability and suggest improvements
4. **Dependencies**: Review dependency management and coupling
5. **Performance**: Identify potential bottlenecks

Focus on:
- Code organization and structure
- Separation of concerns
- Maintainability and extensibility
- Best practices for the tech stack

Provide specific examples from the code and actionable recommendations.
```

### API Design Guidelines
```
Help me design a REST API for [DESCRIBE YOUR DOMAIN]. Please provide:

1. **Resource Modeling**: Define resources and their relationships
2. **Endpoint Design**: RESTful endpoints with proper HTTP methods
3. **Request/Response Format**: JSON schema examples
4. **Error Handling**: Consistent error response format
5. **Authentication**: Security considerations
6. **Versioning Strategy**: API evolution approach
7. **Documentation**: OpenAPI/Swagger specification

Consider:
- RESTful best practices
- HTTP status codes
- Rate limiting
- Caching strategies
- Pagination for collections

Generate OpenAPI spec and example requests/responses.
```

### Database Schema Design
```
Design a database schema for [DESCRIBE YOUR APPLICATION]. Include:

1. **Entity Modeling**: Tables and relationships
2. **Normalization**: Appropriate normal forms
3. **Indexing Strategy**: Performance optimization
4. **Constraints**: Data integrity rules
5. **Migration Strategy**: Schema evolution
6. **Security**: Access control considerations

Provide:
- DDL statements for table creation
- Entity Relationship Diagram (text format)
- Index recommendations
- Sample queries for common operations
- Performance considerations

Consider both relational and NoSQL approaches if applicable.
```

---

## 🐛 Code Review & Quality

### Code Review Checklist
```
Perform a comprehensive code review of the current files. Check for:

**Code Quality**:
- [ ] Readability and clarity
- [ ] Consistent naming conventions
- [ ] Appropriate comments and documentation
- [ ] DRY principle adherence
- [ ] SOLID principles

**Performance**:
- [ ] Efficient algorithms and data structures
- [ ] Memory usage optimization
- [ ] Database query efficiency
- [ ] Caching opportunities

**Security**:
- [ ] Input validation
- [ ] SQL injection prevention
- [ ] XSS protection
- [ ] Authentication/authorization
- [ ] Sensitive data handling

**Testing**:
- [ ] Test coverage
- [ ] Edge case handling
- [ ] Error handling
- [ ] Unit test quality

**Maintainability**:
- [ ] Code organization
- [ ] Dependency management
- [ ] Configuration management
- [ ] Logging and monitoring

Provide specific feedback with line numbers and improvement suggestions.
```

### Performance Optimization
```
Analyze this code for performance optimization opportunities:

1. **Profiling Analysis**: Identify performance bottlenecks
2. **Algorithm Optimization**: Suggest more efficient algorithms
3. **Data Structure Selection**: Recommend better data structures
4. **Memory Management**: Identify memory leaks and optimization
5. **I/O Optimization**: Database queries, file operations, network calls
6. **Caching Strategies**: Where and how to implement caching
7. **Concurrency**: Parallel processing opportunities

For each suggestion, provide:
- Current performance issue
- Proposed solution with code example
- Expected performance improvement
- Implementation complexity
- Trade-offs to consider

Focus on the most impactful optimizations first.
```

### Security Audit
```
Conduct a security audit of this codebase. Focus on:

**Input Validation**:
- User input sanitization
- SQL injection vulnerabilities
- XSS prevention
- Command injection risks

**Authentication & Authorization**:
- Session management
- Password handling
- Access control
- JWT token security

**Data Protection**:
- Sensitive data encryption
- Data transmission security
- Data storage security
- Privacy compliance

**Infrastructure Security**:
- Configuration security
- Dependency vulnerabilities
- Environment variable handling
- Logging security

**Web Security**:
- CSRF protection
- Clickjacking prevention
- Content Security Policy
- HTTPS enforcement

Provide:
- Vulnerability assessment with severity levels
- Specific code examples of issues
- Remediation steps with code samples
- Security best practices recommendations
```

---

## 📚 Documentation

### API Documentation Generator
```
Generate comprehensive API documentation for this codebase. Include:

1. **Overview**: API purpose and capabilities
2. **Authentication**: How to authenticate requests
3. **Base URL**: API endpoint base
4. **Endpoints**: All available endpoints with:
   - HTTP method and URL
   - Request parameters (query, path, body)
   - Request/response examples
   - Error codes and responses
   - Rate limiting information

5. **Data Models**: Schema definitions for all objects
6. **Examples**: Real-world usage scenarios
7. **SDKs**: Code examples in multiple languages
8. **Changelog**: Version history and changes

Format as OpenAPI 3.0 specification and include:
- Interactive examples
- Error handling patterns
- Best practices for consumers
```

### README Generator
```
Generate a comprehensive README.md for this project. Include:

# Project Name

## Description
- What the project does
- Key features and benefits
- Target audience

## Installation
- Prerequisites
- Step-by-step installation
- Environment setup
- Configuration options

## Usage
- Quick start guide
- Basic usage examples
- Advanced usage scenarios
- Command-line options (if applicable)

## API Reference (if applicable)
- Key endpoints
- Authentication
- Examples

## Configuration
- Environment variables
- Configuration files
- Deployment options

## Contributing
- How to contribute
- Development setup
- Testing guidelines
- Code style requirements

## License
- License information

## Support
- Where to get help
- Bug reporting
- Feature requests

Make it engaging with emojis and clear sections. Include code examples and badges.
```

### Code Comments Generator
```
Add comprehensive comments to this code following these guidelines:

1. **Function/Method Comments**: Document purpose, parameters, return values, and side effects
2. **Class Comments**: Describe responsibility and usage
3. **Complex Logic**: Explain algorithms and business logic
4. **TODOs**: Mark areas for future improvement
5. **API Documentation**: JSDoc, docstrings, or equivalent for the language

Comment Standards:
- Use clear, concise language
- Explain WHY, not just WHAT
- Include examples for complex functions
- Document exceptions and error conditions
- Keep comments up-to-date with code changes

Generate comments in the appropriate format for the programming language used.
```

---

## 🧪 Testing

### Test Case Generator
```
Generate comprehensive test cases for this code. Include:

**Unit Tests**:
- Test all public methods/functions
- Test edge cases and boundary conditions
- Test error handling and exceptions
- Mock external dependencies

**Integration Tests**:
- Test component interactions
- Test database operations
- Test API endpoints
- Test external service integrations

**Test Structure**:
- Arrange-Act-Assert pattern
- Descriptive test names
- Setup and teardown methods
- Test data fixtures

**Coverage Areas**:
- Happy path scenarios
- Error conditions
- Edge cases
- Performance tests (if needed)

Generate test code using the appropriate testing framework for the language/tech stack.

Include:
- Test setup and configuration
- Mock/stub implementations
- Assertion examples
- Test data generation
```

### Bug Reproduction Steps
```
Help me create detailed bug reproduction steps for the issue I'm experiencing:

**Issue**: [DESCRIBE THE BUG]

Please provide:

1. **Environment Information**:
   - Operating system and version
   - Software versions
   - Browser/runtime version
   - Relevant configuration

2. **Preconditions**:
   - Required setup or state
   - Data requirements
   - User permissions needed

3. **Step-by-Step Reproduction**:
   - Clear, numbered steps
   - Expected vs actual results
   - Screenshots or logs (where applicable)
   - Timing considerations

4. **Additional Information**:
   - Error messages
   - Console output
   - Network requests
   - Stack traces

5. **Variations**:
   - Alternative reproduction methods
   - Related symptoms
   - Workarounds (if any)

Format this for easy sharing with team members or in bug reports.
```

---

## 💡 Usage Tips

### How to Use These Prompts
1. **Copy** the relevant prompt
2. **Customize** placeholders (marked with [BRACKETS])
3. **Paste** into Claude Code
4. **Add context** by sharing relevant files
5. **Iterate** based on the results

### Prompt Customization
- Replace `[DESCRIBE YOUR DOMAIN]` with your specific domain
- Modify technology stack references as needed
- Adjust complexity level based on your project
- Add specific requirements or constraints

### Best Practices
- **Be Specific**: Add context about your project, tech stack, and requirements
- **Iterate**: Use follow-up questions to refine the output
- **Combine**: Mix and match prompts for comprehensive analysis
- **Validate**: Always review AI-generated code and recommendations

---

## 🤝 Contributing

Have useful prompts to share? Please contribute:

1. **Fork** this repository
2. **Add** your prompt to the appropriate category
3. **Test** the prompt with real code
4. **Document** usage examples
5. **Submit** a pull request

### Prompt Template
```
### Prompt Name
```
Brief description of what this prompt does and when to use it.

[Your prompt text here]
```

**Use Cases**: List specific scenarios where this prompt is helpful
**Customization**: Note any placeholders or customization needed
```

---

*Last Updated: January 2025*  
*Maintained by: AI Toolbox Community*