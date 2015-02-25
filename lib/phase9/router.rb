require_relative '../phase6/router'


module Phase9
  class Route<Phase6::Route

    def initialize(pattern, http_method, controller_class, action_name)
      super
      add_url_methods
    end

    def add_url_methods
    
      case action_name.to_sym
      when :index
        puts "!!!!!!!!"
        name = controller_subject
        add_method "#{name}_url", proc { "/#{name}" }
      when :edit
        name = controller_subject
        add_method "edit_#{name.singularize}_url", proc { |id| "/#{name}/#{id}/edit" }
      when :show, :update, :destroy
        name = controller_subject
        add_method "#{name.singularize}_url", proc { |id| "/#{name}/#{id}"}
      end
    end


     def controller_subject
      controller_class.to_s.underscore.split("_").first
    end

    def add_method(name, body)
      controller_class.send(:define_method,name,&body)
    end
  end

  class Router<Phase6::Router
    def add_route(pattern, http_method, controller_class, action_name)
      @routes << Route.new(pattern, http_method, controller_class,action_name)
    end
  end

end
