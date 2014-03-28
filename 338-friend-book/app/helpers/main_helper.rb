module MainHelper

def image_helper x
image_tag "#{x}.png".html_safe
end

def submit_helper x
submit_tag x
end

def select_helper
select_tag :id, options_from_collection_for_select(Person.order(:id), :id, :name), prompt: ""
end

end
