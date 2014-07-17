require './lib/sassy-namespaces'

Gem::Specification.new do |s|
  # General Project Information
  s.name = "sassy-namespaces"
  s.version = SassyNamespaces::VERSION
  s.date = SassyNamespaces::DATE

  # Author Information
  s.authors = ["Andrew Clark"]
  s.email = ["acdlite@me.com"]
  s.homepage = "https://github.com/acdlite/sassy-namespaces"

  # Project Description
  s.summary = "Namespaces in Sass, minus the headaches."
  s.description = "Namespaces in Sass, minus the headaches."

  # Files to Include
  s.require_paths = ["lib"]

  s.files = Dir.glob("lib/*.*")
  s.files += Dir.glob("sass/**/*.*")
  s.files += ["CHANGELOG.md", "LICENSE.txt", "README.md"]

  # Docs Information
  s.extra_rdoc_files = ["CHANGELOG.md", "LICENSE.txt", "README.md", "lib/sassy-namespaces.rb"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "sassy-namespaces", "--main", "README.md"]

  dependencies = {
    "sass"    => [">= 3.3.0", "< 3.5"],
    "sassy-maps" => [">= 0.3.2", "< 0.5"]
  }
  # Project Dependencies
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      dependencies.each do |project, version|
        s.add_runtime_dependency(project, *version)
      end
    else
      dependencies.each do |project, version|
        s.add_dependency(project, *version)
      end
    end
  else
    dependencies.each do |project, version|
      s.add_dependency(project, *version)
    end
  end
end