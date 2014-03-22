
Location.create! id: 1, place: "beach"
Location.create! id: 2, place: "ocean"
Location.create! id: 3, place: "cave"

ActiveRecord::Base.connection.reset_pk_sequence! "locations"

Destination.create! id: 1, area: "ocean"
Destination.create! id: 2, area: "cave"
Destination.create! id: 3, area: "beach"

ActiveRecord::Base.connection.reset_pk_sequence! "destinations"

TravelLog.create! direction: "west", location_id: 1, destination_id: 1
TravelLog.create! direction: "west", location_id: 1, destination_id: 2
TravelLog.create! direction: "east", location_id: 2, destination_id: 3
