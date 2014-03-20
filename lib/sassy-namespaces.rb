require 'compass'
require 'sassy-maps'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('sassy-namespaces', :path => extension_path)

module SassyNamespaces
  VERSION = "0.1.7"
  DATE = "2014-03-20"
end