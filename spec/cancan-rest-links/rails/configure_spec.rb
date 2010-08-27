require 'spec_helper'
require 'cancan-rest-links/rails/configure'

describe 'CanCan REST Links rails View extension' do
  it "should extend Action View with REST Link helpers" do
    after_init :view do        
      :view.should be_extended_with CanCan::Links::Rest
    end

    init_app_railties :minimal, :view
  end
end