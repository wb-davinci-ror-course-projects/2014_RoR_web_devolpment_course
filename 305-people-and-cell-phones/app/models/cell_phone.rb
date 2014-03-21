class CellPhone < ActiveRecord::Base
  has_one :person, class_name: "People", foreign_key: "cell_phone_id"
end
