Actor.create! id: 1, name: "Fred"
Actor.create! id: 2, name: "Lynne"
Actor.create! id: 3, name: "Cathy"


ActiveRecord::Base.connection.reset_pk_sequence! "actors"

Play.create! id: 1, title: "Macbeth"
Play.create! id: 2, title: "Twelth Night"
Play.create! id: 3, title: "Hamlet"

ActiveRecord::Base.connection.reset_pk_sequence! "plays"

ActorsPlay.create! character: "Macbeth", actor_id: 1, play_id: 1
ActorsPlay.create! character: "Lady Macbeth", actor_id: 2, play_id: 1
ActorsPlay.create! character: "Viola", actor_id: 2, play_id: 2

ActiveRecord::Base.connection.reset_pk_sequence! "actors_plays"
