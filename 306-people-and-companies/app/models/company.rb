class Company < ActiveRecord::Base
  has_many :people, class_name: "Person", foreign_key: "co_id"
end
