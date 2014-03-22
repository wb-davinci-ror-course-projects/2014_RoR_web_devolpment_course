Mentor.create! id: 1, name: "Ted"
Mentor.create! id: 2, name: "Ursula"
Mentor.create! id: 3, name: "Paula"
Mentor.create! id: 4, name: "Phil"
ActiveRecord::Base.connection.reset_pk_sequence! "mentors"

Developer.create! id: 1, first_name: "Ted"
Developer.create! id: 2, first_name: "Rita"
Developer.create! id: 3, first_name: "Dan"
Developer.create! id: 4, first_name: "Paula"
Developer.create! id: 5, first_name: "Phil"
ActiveRecord::Base.connection.reset_pk_sequence! "developers"

MentorsDeveloper.create! mentor_id: 1, developer_id: 2
MentorsDeveloper.create! mentor_id: 2, developer_id: 2
MentorsDeveloper.create! mentor_id: 2, developer_id: 3
MentorsDeveloper.create! mentor_id: 3, developer_id: 4
MentorsDeveloper.create! mentor_id: 4, developer_id: 4
ActiveRecord::Base.connection.reset_pk_sequence! "mentors_developers"
