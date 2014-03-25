module ApplicationHelper
  def picture(person)
    image_tag "#{person.name.downcase}.png"
  end
end
