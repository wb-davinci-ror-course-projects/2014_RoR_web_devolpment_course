class Boss < ActiveRecord::Base
 has_many :employees, class_name: "Employee", foreign_key: "boss_id"
end
