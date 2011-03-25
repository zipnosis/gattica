require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "gattica"
    gemspec.summary = "Gattica is a Ruby library for extracting data from the Google Analytics API."
    gemspec.email = "cannikinn@gmail.com"
    gemspec.homepage = "http://github.com/cannikin/gattica"
    gemspec.description = "Gattica is a Ruby library for extracting data from the Google Analytics API.  It is simple to use, supports metrics, dimensions, sort, filters, goals, and segments"
    gemspec.authors = ["Rob Cameron", "Christopher Le"]
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
