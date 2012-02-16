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
    gem.add_development_dependency "rdoc", "~> 3.11.0"
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
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML::load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Craigler #{version}"
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('README.rdoc', 'LICENSE')
  rdoc.main = 'README.rdoc'
end

