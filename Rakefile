require 'rake/testtask'
require 'bundler/gem_tasks'
require 'coveralls/rake/task'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = Dir.glob("test/**/*_test.rb").sort
  t.verbose = true
end

Coveralls::RakeTask.new

task :test_with_coveralls => [:test, 'coveralls:push']
