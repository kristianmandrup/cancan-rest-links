module CanCan::Link
  module Rest          
    def index_link(object, label = nil)
      label ||= index_label
      obj = index_obj(object)
      path = send :"#{obj}_path"
      link = link_to(label, path) if can?(:read, object)
    end      
                    
    def create_link(object, label = nil)
      label ||= new_label
      obj_name = object_class(object).to_s.downcase
      path = send :"new_#{obj_name}_path"    
      link = link_to(label, path) if can?(:create, object)
    end

    def edit_link(object, label = nil)
     label ||= edit_label
     link_to(label, [:edit, object]) if can?(:edit, object)
    end

    def delete_link(object, options = nil)          
      options ||= {:label => delete_label, :confirm => confirm_label}        
      case options
      when String
        label = options
      when Hash
        label = options[:label]
        confirm_msg = options[:confirm]
      when Array
        label = options[0]
        confirm_msg = options.size > 1 ? options[1] : confirm_label
      end
     link_to(label, object, :method => :delete, :confirm => confirm_msg) if can?(:destroy, object)
    end

    def show_link(object, label = nil)      
      label ||= show_label
      link_to(label, object) if can?(:read, object)
    end

    LINKS = {
      :index  => :list,
      :create => :new,
      :delete => :destroy,
      :edit   => :update,
      :show   => :read
    }
    
    # alias_method :list_link, :index_link   and so on...
    multi_alias LINKS.merge(:_after_ => :link)
    
    protected

    def index_label
      get_label :index
    end

    def new_label
      get_label :new
    end

    def edit_label
      get_label :edit
    end

    def show_label 
      get_label :show
    end 

    def delete_label 
      get_label :delete
    end 
    
    def confirm_label
      get_label :confirm
    end

    def get_label key
      raise 'the method #auth_labels must be available on the View' if !respond_to? :auth_labels
      auth_labels[key]      
    end

    def index_obj(obj)
      object_class(obj).name.pluralize.downcase
    end
    
    def object_class obj
      case obj
      when Array 
        obj.first.class
      when Class
        obj
      else
        obj.class
      end 
    end    
  end    
end

