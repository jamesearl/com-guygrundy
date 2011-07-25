module Blog::BaseHelper
	
	def show_flash
    [:notice, :error, :success].collect do |key|
      content_tag(:div, flash[key], :id => key, :class => "flash flash_#{key}") unless flash[key].blank?
    end.join
  end
end
