require './davinci-sinatra.rb'

# Setup handler for index page at GET / route
get "/" do
  @goats = RacingGoat.all
  halt erb(:index)
end

# TODO: Setup GET handler for form to fill out to create a new goat

# TODO: Setup POST handler for when the new goat form is submitted.

# TODO: Setup GET handler for add/edit goat details form

# TODO: Setup POST handler for submitted add/edit goat details form
