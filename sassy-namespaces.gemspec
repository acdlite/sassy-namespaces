# Replace extension with the name of your extension's .rb file
require './lib/sassy-namespaces'

Gem::Specification.new do |s|
  # Release Specific Information
  #  Replace Extension with the name you used in your extension.rb
  #   in the module with version and date.
  s.version = SassyNamespaces::VERSION
  s.date = SassyNamespaces::DATE

  # Gem Details
  # Replace "extension" with the name of your extension
  s.name = "sassy-namespaces"
  s.rubyforge_project = "sassy-namespaces"
  # Description of your extension
  s.description = %q{Namespaces in Sass, minus the headaches.}
  # A summary of your Compass extension. Should be different than Description
  s.summary = %q{Syntactic sugar for using maps as namespaces.}
  # The names of the author(s) of the extension.
  # If more than one author, comma separate inside of the brackets
  s.authors = ["Andrew Clark"]
  # The email address(es) of the author(s)
  # If more than one author, comma separate inside of the brackets
  s.email = ["acdlite@me.com"]
  # URL of the extension
  s.homepage = "https://github.com/acdlite/sassy-namespaces"

  # Gem Files
  # These are the files to be included in your Compass extension.
  # Uncomment those that you use.

  # README file
  s.files = ["README.md"]

  # CHANGELOG
  # s.files += ["CHANGELOG.md"]

  # Library Files
  s.files += Dir.glob("lib/**/*.*")

  # Sass Files
  s.files += Dir.glob("stylesheets/**/*.*")

  # Template Files
  # s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  # Versions of Ruby and Rubygems you require
  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}

  # Gems Dependencies
  s.add_dependency("sass",       [">= 3.3"])
  s.add_dependency("compass",    [">= 0.12"])
  s.add_dependency("sassy-maps", [">= 0.3.2"])
end
