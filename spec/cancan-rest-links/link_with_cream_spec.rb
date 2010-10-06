require 'spec_helper'                  

# extend_view_with CanCan::Link::Rest
require 'cancan-rest-links/rails/configure'
require 'cream'

class Post
end

# From cream: The following module should be added to Rails view
# translate_labels has been stubbed out to just return the action as the translation for each "action"
module Cream::Helper
  module AuthLabel          
    def translate_labels
      labels = {}
      %w{new edit delete show sign_in sign_out sign_up edit_registration}.each do |action|     
        labels[action.to_sym] = action
      end 
      labels[:confirm] = 'confirm'
      labels           
    end    
  end
end

describe CanCan::Link::Rest do  
  describe '#index_link' do
    it "should create an index link" do
      
      # TODO: Should be renamed to:- view_engine do ...
      # view engine
      view_engine do |e, view|
        label = 'index'
        path = 'post/index'        
        post = Post.new

        puts view.auth_labels.inspect

        view.stubs(:posts_path).returns path
        view.stubs(:can?).returns true
        view.stubs(:link_to).with(label, path).returns 'it works'        

        res = e.run_template_locals :post => post, :name => label do 
          %{<%= index_link(post, name) %> }
        end 
        res.should match /it works/
      end                     
    end
  end
  
  describe '#create_link' do
    it "should create a create link" do
      view_engine do |e, view|
        label = 'create'
        path = 'post/create'        
        post = Post.new
  
        view.stubs(:new_post_path).returns path
        view.stubs(:can?).returns true
        view.stubs(:link_to).with(label, path).returns 'it works'        
  
        res = e.run_template_locals :post => post, :name => label do 
          %{<%= create_link(post, name) %> }
        end
        res.should match /it works/
      end                     
    end
  end
  
  describe '#edit_link' do
    it "should create a create link" do
      view_engine do |e, view|
        label = 'create'
        path = 'post/create'        
        post = Post.new
  
        view.stubs(:can?).returns true
        view.stubs(:link_to).with(label, [:edit, post]).returns 'it works'        
  
        res = e.run_template_locals :post => post, :name => label do 
          %{<%= edit_link(post, name) %> }
        end
        res.should match /it works/
      end                     
    end
  end
  
  describe '#delete_link' do
    it "should create a delete link" do
      view_engine do |e, view|
        label = 'delete'
        path = 'post/delete'        
        post = Post.new
  
        view.stubs(:can?).returns true
        view.stubs(:link_to).returns 'it works'        
  
        res = e.run_template_locals :post => post, :name => label do 
          %{<%= delete_link(post, name) %> }
        end
        res.should match /it works/
      end                     
    end
  end
  
  
  describe '#show_link' do
    it "should create a show link" do
      view_engine do |e, view|
        label = 'show'
        path = 'post/show'        
        post = Post.new

        view.stubs(:can?).returns true
        view.stubs(:link_to).with(label, post).returns 'it works'        

        res = e.run_template_locals :post => post, :name => label do 
          %{<%= show_link(post, name) %> }
        end
        res.should match /it works/
      end                     
    end
  end
end

