module ApplicationHelper
 def title 
   base_title = "Grant management System"
   if @title.nil?
     base_title
   else
     "#{base_title}| #{@title}"
   end
  end 
  
  def logo
   image_tag("logo.png", :alt => "GMS App", :class => "round")
  end
    
end
