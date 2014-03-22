class Employee < ActiveRecord::Base
    belongs_to :boss, class_name: "Boss", foreign_key: "boss_id"
end
