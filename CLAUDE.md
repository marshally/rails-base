# Claude Code Development Guidelines

This document provides guidelines for working with Claude Code on this Rails project.

## Project Overview

This is a Rails 8.1 application with:
- PostgreSQL database
- Hotwire (Turbo + Stimulus) for frontend interactivity
- Tailwind CSS for styling
- RSpec for testing
- Devise for authentication
- Pundit for authorization
- Sidekiq for background jobs

## Code Style & Conventions

### Ruby Style
- Follow Rails conventions and Ruby best practices
- Use Rails Omakase style guide (enforced by RuboCop)
- Keep methods small and focused (Single Responsibility Principle)
- Prefer explicit over implicit
- Use meaningful variable and method names

### Rails Conventions
- RESTful routes and controllers
- Thin controllers, domain logic in models or services
- Use concerns for shared behavior
- Keep views simple, move logic to helpers or view models
- Use Rails conventions for naming (snake_case for files, CamelCase for classes)

### Testing
- Write tests for all new features
- Follow RSpec best practices:
  - One assertion per test when possible
  - Use descriptive test names
  - Use factories (Factory Bot) instead of fixtures
  - Test behavior, not implementation
- Aim for high test coverage (>90%)

## File Organization

```
app/
├── controllers/    # Request handling
├── models/         # Business logic and data models
├── views/          # Templates
├── jobs/           # Background jobs
├── policies/       # Authorization rules (Pundit)
├── helpers/        # View helpers
└── javascript/     # Stimulus controllers

spec/
├── models/         # Model tests
├── requests/       # Request/controller tests
├── system/         # Feature tests with Capybara
├── factories/      # Test data factories
└── support/        # Test helpers and configuration
```

## Development Workflow

### Adding Features
1. Write failing tests first (TDD approach preferred)
2. Implement the feature
3. Ensure all tests pass
4. Run RuboCop and fix any violations
5. Commit with descriptive message

### Making Changes
1. Create a feature branch
2. Make changes with tests
3. Run test suite: `bin/rspec`
4. Run linter: `bin/rubocop`
5. Pre-commit hooks will automatically run
6. Push and create PR

### Database Changes
1. Generate migration: `bin/rails g migration AddFieldToModel`
2. Edit migration file
3. Run migration: `bin/rails db:migrate`
4. Update model tests
5. Update factories if needed

## Common Tasks

### Creating Models
```bash
bin/rails g model User email:string name:string
bin/rails db:migrate
```

### Creating Controllers
```bash
bin/rails g controller Users index show
```

### Adding Authentication to Controllers
```ruby
class ProtectedController < ApplicationController
  before_action :authenticate_user!
end
```

### Adding Authorization
```ruby
class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    authorize @post
    # ...
  end
end
```

### Background Jobs
```ruby
class MyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Job logic here
  end
end

# Enqueue job
MyJob.perform_later(arg1, arg2)
```

## Testing Guidelines

### Model Tests
Test validations, associations, scopes, and methods:

```ruby
RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
  end

  describe "associations" do
    it { should have_many(:posts) }
  end
end
```

### Request Tests
Test controller actions and responses:

```ruby
RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end
end
```

### System Tests
Test full user workflows with browser:

```ruby
RSpec.describe "User sign in", type: :system do
  it "allows user to sign in" do
    user = create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end
```

## Debugging Tips

- Use `binding.pry` or Rails console for debugging
- Check `log/development.log` for request details
- Use `bin/rails console` for interactive exploration
- Run single test: `bin/rspec spec/models/user_spec.rb:10`

## Deployment

- Ensure all tests pass before deploying
- Run security scans: `bin/brakeman`
- Check for dependency vulnerabilities: `bundle audit`
- Review and test in staging environment first
- Deploy to production using CI/CD pipeline

## Getting Help

- Rails Guides: https://guides.rubyonrails.org/
- RSpec Documentation: https://rspec.info/
- Devise Wiki: https://github.com/heartcombo/devise/wiki
- Tailwind CSS Docs: https://tailwindcss.com/docs

## Working with Claude Code

When asking Claude to help with this project:
- Mention the specific feature or area you're working on
- Provide context about what you're trying to achieve
- Reference this document for project conventions
- Ask for tests to be included with new features
- Request code that follows Rails best practices
