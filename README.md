![MVP](https://raw.githubusercontent.com/danilozag1992/MVP/development/app/assets/images/project.png)
## Description
This is Ruby on Rails capstone project, part of the curriculum at [Microverse](https://www.microverse.org/). This is event scheduling app, I made it for somebody who is Coach of some sport, he/her will be able to Schedule practice in desired time.

## Link to live Demo
[Live MVP](https://infinite-spire-29957.herokuapp.com/)

## Built With
- Ruby 
- Ruby on Rails
- Bootstrap 4
- Rubocop
- PostgreSQL

## Features
- User can signup/login using his/her username
- User can create, edit, delete Group or Practice, dependent of practice(is it individual or group) 
- User can assign practice to group
- User can see list of Coaches, Groups, Group Practices and Individual Practices
- User can search desired practice
- User can see date and time of the scheduled practice
# rspec-rails [![Build Status][]][travis-ci] [![Code Climate][]][code-climate] [![Gem Version][]](gem-version)

`rspec-rails` brings the [RSpec][] testing framework to [Ruby on Rails][]
as a drop-in alternative to its default testing framework, Minitest.

In RSpec, tests are not just scripts that verify your application code.
They’re also specifications (or _specs,_ for short):
detailed explanations of how the application is supposed to behave,
expressed in plain English.

Use **[`rspec-rails` 3.x][]** for Rails earlier than 5.0.
Use **[`rspec-rails` 1.x][]** for Rails 2.x.

[Build Status]: https://secure.travis-ci.org/rspec/rspec-rails.svg?branch=master
[travis-ci]: https://travis-ci.org/rspec/rspec-rails
[Code Climate]: https://codeclimate.com/github/rspec/rspec-rails.svg
[code-climate]: https://codeclimate.com/github/rspec/rspec-rails
[Gem Version]: https://badge.fury.io/rb/rspec-rails.svg
[gem-version]: https://badge.fury.io/rb/rspec-rails
[RSpec]: https://rspec.info/
[Ruby on Rails]: https://rubyonrails.org/
[`rspec-rails` 1.x]: https://github.com/dchelimsky/rspec-rails
[`rspec-rails` 3.x]: https://github.com/rspec/rspec-rails/tree/3-9-maintenance

## Installation

**IMPORTANT** This README / branch refers to the current development build.
See the `4-0-maintenance` branch on Github if you want or require the latest stable release.

1. Add `rspec-rails` to **both** the `:development` and `:test` groups
   of your app’s `Gemfile`:

   ```ruby
   # Run against the latest stable release
   group :development, :test do
     gem 'rspec-rails', '~> 4.0.0'
   end

   # Or, run against the master branch
   # (requires master-branch versions of all related RSpec libraries)
   group :development, :test do
     %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
       gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
     end
   end
   ```

   (Adding it to the `:development` group is not strictly necessary,
   but without it, generators and rake tasks must be preceded by `RAILS_ENV=test`.)

2. Then, in your project directory:

   ```sh
   # Download and install
   $ bundle install

   # Generate boilerplate configuration files
   # (check the comments in each generated file for more information)
   $ rails generate rspec:install
         create  .rspec
         create  spec
         create  spec/spec_helper.rb
         create  spec/rails_helper.rb
   ```
