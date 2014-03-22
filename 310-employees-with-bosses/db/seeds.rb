

Boss.create! id: 1, first_name: "Fred"
Boss.create! id: 2, first_name: "Sal"
ActiveRecord::Base.connection.reset_pk_sequence! "bosses"


Employee.create! name: "Sal", boss_id: 1
Employee.create! name: "Phil", boss_id: 1
Employee.create! name: "Jim", boss_id: 2
Employee.create! name: "Fred", boss_id: nil
ActiveRecord::Base.connection.reset_pk_sequence! "employees"