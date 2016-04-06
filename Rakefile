require 'rubocop/rake_task'

task :default => [:rubocop]
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # don't abort rake on failure
  task.fail_on_error = true
end
