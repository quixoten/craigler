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
    gem.add_dependency "hpricot", "~> 0.8"
    gem.add_development_dependency "shoulda", "~> 2.10"
    gem.add_development_dependency "yard", "~> 0.7"
  end

  Jeweler::GemcutterTasks.new

rescue LoadError
  abort "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
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

begin
  desc "Create a YAML map of craigslist URLs"
  require 'hpricot'
  require 'open-uri'
  task :map do
    map = {}
    continents = map[:continents] = {}
    urls = map[:urls] = {}

    doc = Hpricot(open('http://www.craigslist.org/about/sites'))
    (doc/'div.colmask').each do |elem|
      key = (elem%'h1 a')['name'].strip.to_sym
      continent = continents[key] = {}
      continent[:name] = (elem%'h1').inner_text.strip
      states = continent[:states] = {}
      state = nil

      (elem/'.state_delimiter').each do |elem|
        state_key = elem.inner_text
        if state_key == ""
          state_key = (elem.next_sibling%'a')['href']
          state_key.sub!(%r[http://([^.]+).*], '\1')
        end

        state_key.strip!
        state_key.downcase!
        state_key.gsub!(/\s/,'_')
        state_key.gsub!(/[.,]/,'')
        state = states[state_key.to_sym] = []

        (elem.next_sibling/'a').each do |elem|
          href = elem['href']
          url_key = URI(href).host.split('.').first.to_sym
          url = urls[url_key] = href
          state << url_key
        end
      end
    end

    open('map.yaml', 'w') do |f|
      YAML::dump(map, f)
    end
  end
rescue LoadError
  task :map do
    abort "Hpricot is not available. Install it with: sudo gem install hpricot"
  end
end

task :build => :map
task :default => :test
