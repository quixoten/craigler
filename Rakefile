require "bundler/gem_tasks"
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

require 'yard'
YARD::Rake::YardocTask.new() do |t|
  t.files = ["-", "LICENSE.txt"]
end

task :default => :test

