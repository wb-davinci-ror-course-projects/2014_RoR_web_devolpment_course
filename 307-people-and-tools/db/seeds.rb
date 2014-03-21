Person.create! id: 1, name: "Eve"
Person.create! id: 2, name: "Ed"
Person.create! id: 3, name: "Tony"
ActiveRecord::Base.connection.reset_pk_sequence! "people"

Tool.create! tool_name: "bandsaw", person_id: 1
Tool.create! tool_name: "drill press", person_id: 1
Tool.create! tool_name: "planer", person_id: nil
Tool.create! tool_name: "lathe", person_id: 2

ActiveRecord::Base.connection.reset_pk_sequence! "tools"
