begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cancan-rest-links"
    gem.summary = %Q{Rest link helpers for CanCan}
    gem.description = %Q{Guard your links with permissions}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/cancan-rest-links"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec",             ">= 2.0.1"
    gem.add_development_dependency "rspec-action_view", ">= 0.3.4"
    gem.add_development_dependency 'generator-spec',    ">= 0.7.3"

    gem.add_dependency 'cancan',            ">= 1.4.1"
    gem.add_dependency 'require_all',       "~> 1.2.0"
    gem.add_dependency 'sugar-high',        "~> 0.4.0"
    gem.add_dependency 'r3_plugin_toolbox', ">= 0.4.0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
