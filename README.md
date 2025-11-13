# Rails Base Template

A comprehensive Rails 8.1 template with modern tooling, authentication, testing, and deployment configurations.

## Features

### Core Framework
- **Rails 8.1.1** with Ruby 3.2.2
- **PostgreSQL** database
- **Hotwire** (Turbo + Stimulus) for reactive UIs
- **Action Text** with Trix editor for rich text content

### Frontend
- **Tailwind CSS 4** with custom design system
  - Custom color palette (primary, success, warning, error, info)
  - Typography system (Inter + JetBrains Mono)
  - Accessibility features (focus states, reduced motion support)
- **Import maps** (no Node.js build step required)
- **Propshaft** asset pipeline

### Authentication & Authorization
- **Devise** for user authentication
- **Pundit** for authorization policies
- **Bcrypt** for password hashing

### Background Jobs
- **Sidekiq** with Redis for background processing
- **Solid Queue** as database-backed alternative
- Web UI available at `/sidekiq` (development only)

### Testing
- **RSpec** testing framework
- **Capybara** + **Selenium WebDriver** for system tests
- **Factory Bot** for test fixtures
- **Faker** for fake data generation
- **Shoulda Matchers** for one-liner tests
- **Database Cleaner** for test isolation
- **Parallel Tests** for faster test execution
- **Guard** for continuous testing

### Code Quality
- **RuboCop** with Rails Omakase + RSpec rules
- **Brakeman** security scanner
- **Bundler Audit** for dependency vulnerabilities
- Git pre-commit hooks for automated checks

### Monitoring & Error Tracking
- **Sentry** for error tracking and performance monitoring
- **New Relic** APM for application performance

### CI/CD
- **GitHub Actions** workflows:
  - Continuous Integration (tests, linting, security scans)
  - Claude Code integration (@claude mentions in issues/PRs)
  - Claude Code Review (automatic PR reviews with 'claude-review' label)
- **Dependabot** for automated dependency updates

### Deployment
- **Docker** containerization with multi-stage builds
- **Kamal** for deployment automation
- **Fly.io** configuration included
- **Thruster** for HTTP caching/compression

## Getting Started

### Prerequisites

- Ruby 3.2.2
- PostgreSQL
- Redis (for Sidekiq)
- Bundler

### Installation

1. Clone this repository
2. Run the setup script:

```bash
bin/setup
```

This will:
- Install dependencies
- Set up the database
- Install Git hooks
- Precompile assets
- Start the development server

### Development

Start all services (Rails, Tailwind watcher, Sidekiq):

```bash
bin/dev
```

Or start services individually:

```bash
bin/rails server    # Rails server
bin/rails tailwindcss:watch  # Tailwind CSS watcher
bundle exec sidekiq  # Background job worker
```

### Testing

```bash
# Run all tests
bin/rspec

# Run specific test file
bin/rspec spec/models/user_spec.rb

# Run tests with coverage
rake spec:coverage

# Run tests in parallel
bundle exec parallel_rspec spec/

# Continuous testing with Guard
bundle exec guard
```

### Code Quality

```bash
# Run RuboCop
bin/rubocop

# Auto-fix RuboCop violations
bin/rubocop -A

# Run Brakeman security scan
bin/brakeman

# Run all CI checks locally
bin/ci
```

## Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
# Database
DATABASE_URL=postgresql://localhost/rails_base_development

# Redis (for Sidekiq)
REDIS_URL=redis://localhost:6379/0

# Error Tracking (optional)
SENTRY_DSN=your_sentry_dsn_here
SENTRY_RELEASE=your_release_version

# APM (optional)
NEW_RELIC_LICENSE_KEY=your_license_key
NEW_RELIC_APP_NAME=Your App Name

# GitHub Actions (for Claude Code)
ANTHROPIC_API_KEY=your_api_key_here
```

### Tailwind CSS Customization

Edit `app/assets/tailwind/application.css` to customize:
- Color palette
- Typography
- Spacing scale
- Border radius
- Shadows
- Animations

### Adding New Gems

1. Add to `Gemfile`
2. Run `bundle install`
3. Commit `Gemfile` and `Gemfile.lock` together

## Deployment

### Docker

Build and run with Docker:

```bash
docker build -t rails-base .
docker run -p 3000:3000 rails-base
```

### Kamal

Deploy with Kamal:

```bash
kamal setup    # First time only
kamal deploy   # Deploy
```

### Fly.io

Deploy to Fly.io:

```bash
fly deploy
```

## Project Structure

```
├── app/
│   ├── assets/          # Stylesheets and images
│   ├── controllers/     # Request handlers
│   ├── jobs/            # Background jobs
│   ├── models/          # Data models
│   ├── policies/        # Pundit authorization policies
│   └── views/           # Templates
├── bin/                 # Executable scripts
├── config/              # Application configuration
├── db/                  # Database files
├── lib/tasks/           # Custom Rake tasks
├── spec/                # RSpec tests
│   ├── factories/       # Factory Bot factories
│   ├── models/          # Model specs
│   ├── requests/        # Request specs
│   └── system/          # System specs
└── .github/workflows/   # CI/CD workflows
```

## Contributing

1. Create a feature branch
2. Make your changes with tests
3. Ensure all tests pass: `bin/rspec`
4. Ensure RuboCop passes: `bin/rubocop`
5. Commit your changes (pre-commit hooks will run)
6. Push and create a pull request

## License

This project is available as open source under the terms of the MIT License.

## Credits

Built with [Claude Code](https://claude.com/claude-code)
