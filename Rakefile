# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Madridrb::Application.load_tasks

task :default => [:spec]

desc 'run Rspec specs'
task :spec do
  sh 'bundle exec rspec spec'
end
