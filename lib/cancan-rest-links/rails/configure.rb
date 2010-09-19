require 'active_support/railtie'
require 'r3_plugin_toolbox'

Rails3::Plugin::Extender.new do
  # extend action_view with methods from some modules
  extend_rails :view do
    extend_with CanCan::Link::Rest
  end    
end
