module ApplicationHelper
	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			#key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key}' role='alert'>#{value}</div>".html_safe
	  end
	end
end
