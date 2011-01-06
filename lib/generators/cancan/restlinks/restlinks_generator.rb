require 'rails/generators/base'
require 'sugar-high/array'
require 'active_support/inflector'
require 'rails3_artifactor'
require 'logging_assist'

module Cancan
  module Generators
    class RestlinksGenerator < Rails::Generators::Base
      desc "Configures Rails app for use with CanCan REST links"

      source_root File.dirname(__FILE__) + '/templates'

      class_option :locales, :type => :array, :default => ['all'], :desc => 'locales to generate for'

      def main_flow      
        copy_locales
      end
  
      protected

      include Rails3::Assist::BasicLogger
      # extend Rails3::Assist::UseMacro

      def supported_locales
        [:en, :da]
      end

      def locales
        return supported_locales if options[:locales].include? 'all'
        options[:locales].map(&:to_sym) & supported_locales
      end
  
      def copy_locales
        locales.each do |locale|          
          template "restlinks.#{locale}.yml", "config/locales/cream.#{locale}.yml"
        end
      end
    end
  end
end