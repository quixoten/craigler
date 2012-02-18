require 'rubygems'
require 'rake'
require 'yaml'

class Symbol
  def <=>(other)
    self.to_s <=> other.to_s
  end
end

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

map = {}
begin
  require 'hpricot'
  require 'open-uri'
  task :map do
    continents = map[:continents] = {}
    urls = map[:urls] = {}
    categories = map[:categories] = {}

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

    doc = Hpricot(open('http://provo.craigslist.org/sss/'))
    (doc/'#catAbb option').each do |elem|
      value = elem['value']

      if value.length > 0
        key = value.strip.to_sym
        category = categories[key] = elem.inner_text.strip
      end
    end
  end
rescue LoadError
  task :map do
    abort "Hpricot is not available. Install it with: sudo gem install hpricot"
  end
end

begin
  desc "Compile erb templates"
  require 'erubis'
  task :compile => :map do
    open('src/craigler.erb', 'r') do |f|
      rb = Erubis::Eruby.new(f.read)
      open('lib/craigler.rb', 'w') do |f|
        f.write(rb.result(map))
      end
    end

    map[:continents].each do |k, v|
      open('src/continent.erb', 'r') do |f|
        rb = Erubis::Eruby.new(f.read)
        open("lib/craigler/#{k.to_s.downcase}.rb", 'w') do |f|
          f.write(rb.result({:key => k}.merge(v)))
        end
      end
    end
  end
rescue LoadError
  task :compile do
    abort "Erubis is not available. Install it with: sudo gem install erubis"
  end
end

task :build => :compile
task :default => :test
