require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "gattica"
    gemspec.summary = "Gattica is a straight forward Ruby Gem for getting data from the Google Analytics API."
    gemspec.email = "chrisl@seerinteractive.com"
    gemspec.homepage = "http://github.com/chrisle/gattica"
    gemspec.description = "Gattica is a straight forward Ruby Gem for getting data from the Google Analytics API.  It supports metrics, dimensions, sort, filters, goals, and segments"
    gemspec.authors = ["Christopher Le, et all"]
    # Current version of hpricot 0.8.3 seg faults randomly.  Use 0.8.2 instead.
    # see: (https://github.com/hpricot/hpricot/issues#issue/32).
    gemspec.add_dependency 'hpricot', '>=0.8.4'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end
