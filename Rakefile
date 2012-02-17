require 'rubygems'
require 'rake'
require 'yaml'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "craigler"
    gem.summary = %Q{Search API for craigslist}
    gem.email = "quixoten@gmail.com"
    gem.homepage = "http://github.com/threetrieslater/craigler"
    gem.authors = ["Devin Christensen"]
    gem.add_dependency "hpricot", "~> 0.8.4"
    gem.add_development_dependency "shoulda", ">= 2.10.3"
    gem.add_development_dependency "yard", "~> 0.7.5"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

  Jeweler::GemcutterTasks.new

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
  exit
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. Install with: sudo gem install rcov"
  end
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new()
rescue LoadError
  task :yard do
    abort "YARD is not avaialable. Install it with: sudo gem install yard"
  end
end

task :default => :test
