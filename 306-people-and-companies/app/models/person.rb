class Person < ActiveRecord::Base
  belongs_to :company, class_name: "Company", foreign_key: "co_id"
end
