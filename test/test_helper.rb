require 'craigler'
require 'test/unit'
require 'shoulda'

module Craigler
  class Search
    def open(*args)
      @@results_page ||= Kernel::open("http://saltlakecity.craigslist.org/search/sss?query=Honda&format=rss&s=0").read()
    end
  end
end
