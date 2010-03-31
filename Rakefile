require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :spec

desc 'Generate documentation for the clicktale plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Clicktale'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run all specifications"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

begin  
  require 'jeweler'  
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "clicktale"
    gemspec.summary = "Use ClickTale analytics service with rails sites that require sessions"
    gemspec.description = "Use ClickTale (http://www.clicktale.com/) analytics service with rails sites that require sessions (user authentication for example)"
    gemspec.email = "al@railsware.com"
    gemspec.homepage = "http://github.com/railsware/clicktale"
    gemspec.description = gemspec.description
    gemspec.authors = ["Railsware LLC"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

