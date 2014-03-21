Company.create! id: 1, name: "Microsoft"
Company.create! id: 2, name: "IBM"
Company.create! id: 3, name: "Sun"

ActiveRecord::Base.connection.reset_pk_sequence! "companies"

Person.create! name: "John", co_id: 1
Person.create! name: "Jill", co_id: 2
Person.create! name: "Jack", co_id: 2
Person.create! name: "Ursula", co_id: nil


ActiveRecord::Base.connection.reset_pk_sequence! "people"
