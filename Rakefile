#!/usr/bin/env rake
begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

task :run do
  puts "Running benchmarks\n"
  puts "Running Ruby benchmarks\n"

  Dir["benchmarks/**/*.rb"].each do |file|
    load file
  end

  puts "Done!"
end

task default: :run
