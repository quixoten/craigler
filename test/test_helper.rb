require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'craigler'

module Craigler
  class Search
    def open(*args)
      @@results_page ||= Kernel::open("http://saltlakecity.craigslist.org/search/sss?query=Honda&format=rss&s=0").read()
    end
  end
end
