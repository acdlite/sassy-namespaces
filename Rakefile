require 'rubygems/package_task'

spec = eval(File.read("sassy-namespaces.gemspec"), binding, "sassy-namespaces.gemspec")

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

desc "Run tests and build sassy-namespaces-#{spec.version}.gem"
task :build => [:test, :gem]

task :default => :test
desc "run the tests"
task :test do
  system('cd test && bundle install --quiet && bundle exec compass compile --force')
end

desc "Tag the repo as #{spec.version} and push the code and tag."
task :tag do
  sh "git tag -a -m 'Version #{spec.version}' v#{spec.version}"
  sh "git push --tags origin #{`git rev-parse --abbrev-ref HEAD`}"
end

desc "Push sassy-namespaces-#{spec.version}.gem to the rubygems server"
task :push_gem do
  sh "gem push pkg/sassy-namespaces-#{spec.version}.gem"
end