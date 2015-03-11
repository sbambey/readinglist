module ApplicationHelper
	def active_link(controller, action = nil)
		if action
			if(params[:controller] == controller && params[:action] == action)
				return " class='active'".html_safe
			end
		else
			if(params[:controller] == controller)
				return " class='active'".html_safe
			end
		end
	end
	
	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		else
			key
		end
	end

	def no_flash?(action)
		no_flash = ["lists#new", "lists#show", "lists#index", "lists#edit", "lists#create", "lists#update"]
		no_flash.include?(action)
	end
	
	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key}' role='alert'>#{value}</div>".html_safe
	  end
	end

	def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-default btn-sm btn-add", data: {id: id, fields: fields.gsub("\n", " ")})
  end
end
