require 'spec_helper' 
require 'generator-spec'

require_generator :cancan => :restlinks

RSpec::Generator.configure do |config|
  config.debug = true
  config.remove_temp_dir = true
  config.default_rails_root(__FILE__) 
  config.lib = File.dirname(__FILE__) + '/../lib'
  config.logger = :stdout  # :file
end


describe 'Restlinks generator' do   
  use_helpers :controller, :special, :file
    
  setup_generator :licenses do
    tests Cancan::Generators::RestlinksGenerator
  end

  describe "Run it!" do
    before :each do
      @generator = with_generator do |g|    
        g.run_generator
      end
    end

    it "should have created a locales file for CanCan REST links" do
      # Rails3::Assist::Files.locale_files.file_names.should include('cream.en.yml')
      @generator.should have_locale_file 'cream.en'
    end    
  end
end
