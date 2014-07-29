require 'sassy-maps'

stylesheets_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'sass'))

begin
  require 'compass'
  Compass::Frameworks.register('sassy-namespaces', :stylesheets_directory => stylesheets_path)
rescue LoadError
  # compass not found, register on the Sass path via the environment.
  if ENV.key? 'SASS_PATH'
    ENV['SASS_PATH'] += File::PATH_SEPARATOR + stylesheets_path
  else
    ENV['SASS_PATH'] = stylesheets_path
  end
end

module SassyNamespaces
  VERSION = "0.2.2"
  DATE = "2014-07-29"
end