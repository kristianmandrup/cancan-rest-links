require 'spec_helper'
require 'cancan-rest-links/rails/configure'

module Minimal
  class Application < Rails::Application
    config.active_support.deprecation = :log
  end
end


describe 'CanCan REST Links rails View extension' do
  it "should extend Action View with REST Link helpers" do
    after_init :view do        
      :view.should be_extended_with CanCan::Link::Rest
    end

    init_app_railties :minimal, :view
  end
end