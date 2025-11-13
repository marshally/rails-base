# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial Rails 8.1.1 application with PostgreSQL
- Tailwind CSS 4 with custom design system
- Action Text with Trix editor for rich text content
- Devise authentication with User model
- Pundit authorization
- Sidekiq with Redis for background job processing
- RSpec testing framework with comprehensive test setup
- Capybara and Selenium WebDriver for system testing
- Factory Bot and Faker for test data generation
- Shoulda Matchers for one-liner tests
- Database Cleaner for test isolation
- Parallel Tests for faster test execution
- Guard for continuous testing and linting
- RuboCop with Rails Omakase and RSpec rules
- Sentry for error tracking and performance monitoring
- New Relic APM for application performance monitoring
- GitHub Actions CI/CD workflows
- Claude Code integration workflows
- Dependabot configuration for automated dependency updates
- Docker containerization with multi-stage builds
- Kamal deployment tool configuration
- Procfile.dev for local development with multiple services
- Git pre-commit hooks for automated code quality checks
- Custom Rake tasks for testing and Sidekiq
- Comprehensive documentation (README, CLAUDE.md, .cursorrules)

### Configuration
- Solid Cache, Queue, and Cable for database-backed infrastructure
- Custom Tailwind theme with design tokens
- Environment-based configuration for monitoring tools
- Multi-database setup for production (cache, queue, cable)
- RuboCop configuration with custom exclusions
- Guardfile for file watching and auto-testing

### Developer Experience
- bin/setup script for one-command project setup
- bin/dev for starting all services simultaneously
- Comprehensive test helpers and support files
- Auto-installation of Git hooks
- Color-coded CLI output for better UX

## [1.0.0] - 2025-11-13

### Initial Release
- Base Rails template with modern tooling and best practices
- Production-ready authentication, testing, and deployment setup
- Comprehensive documentation and developer guidelines

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)
