require 'compass'
require 'sassy-maps'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('SassyNamespaces', :path => extension_path)

module SassyNamespaces
  VERSION = "0.1.1"
  DATE = "2014-03-17"
end