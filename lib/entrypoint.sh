#!/bin/sh

set -e

bundle config set --local with 'ci'
bundle config set --local without 'default development test'
bundle install

ruby /action/lib/index.rb
