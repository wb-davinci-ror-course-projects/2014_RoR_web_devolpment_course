require './davinci-sinatra.rb'

get "/" do
  halt erb(:browse)
end

get "/topic/:language" do
  language = params[:language]
  @books = Book.where("title ilike ?", "%#{language}%")
  @header = "Books about #{language}"
  halt erb(:search_results)
end

get "/author/:last_name" do
  last_name = params[:last_name]
  @books = Book.where("author ilike ?", "%#{last_name}")
  @header = "Books by #{last_name}"
  halt erb(:search_results)
end

get "/year/:year" do
  year = params[:year]
  @books = Book.where(publication_year: year)
  @header = "Books published in #{year}"
  halt erb(:search_results)
end

get "/isbn/:number" do
  number = params[:number]
  @books = Book.where(isbn: number)
  halt erb(:show)
end

# TODO: GET handler for routes like /year/2011, /year/2007, etc.

# TODO: GET handler for routes like /author/Olsen,
#       /author/Crockford, etc.

# TODO: GET handler for routes like /topic/jQuery, /topic/CSS, etc.

# TODO: GET handler for routes like /isbn/1449397220, 
#       /isbn/1449325947, etc.

# just get requests
# get (/year/:year)
# year = params[:year]
# @     =
# @     =
# halt erb(:search_results)
# end