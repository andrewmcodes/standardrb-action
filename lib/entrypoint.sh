#!/bin/sh

set -e

# this install standard for use in the next step
# gem install standard

# does this run in the context of the project checkout? 
# i think so
cat Gemfile

bundle config set --local with 'ci'
bundle config set --local without 'default development test'
bundle install

# this runs the standardrb binary and reports results to GitHub
ruby /action/lib/index.rb
