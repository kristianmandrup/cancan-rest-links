require 'spec_helper'                  

# extend_view_with CanCan::Link::Rest
require 'cancan-rest-links/rails/configure'

class Post
end

module CanCan::Links
  module Rest
    class << self
      def translations
        {:index => 'indeks', :new => 'ny', :edit => 'rediger', :delete => 'slet', :show => 'vis', :confirm => 'accepter'}
      end

      def translate_labels
        rest_labels.inject({}) {|result, action| 
          result[action.to_sym] = translations[action.to_sym].humanize 
          result
        }
      end    
    end
  end
end

describe CanCan::Link::Rest do  
  describe '#index_link' do
    it "should not allow translations to be switched on later" do
      CanCan::Links::Rest.labels[:index].should == 'Index'
      CanCan::Links::Rest.labels[:confirm].should == 'Confirm'
      
      CanCan::Links::Rest.translate = true
      CanCan::Links::Rest.translate_labels?.should be_true
      CanCan::Links::Rest.labels[:index].should_not == 'Indeks'
      CanCan::Links::Rest.labels[:confirm].should_not == 'Accepter'
    end

    it "should allow translation to be turned on initially" do
      CanCan::Links::Rest.translate = true
      CanCan::Links::Rest.translate_labels?.should be_true
      CanCan::Links::Rest.labels[:index].should_not == 'Indeks'
      CanCan::Links::Rest.labels[:confirm].should_not == 'Accepter'
    end
  end
end

