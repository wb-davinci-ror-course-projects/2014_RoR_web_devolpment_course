require './davinci-sinatra.rb'

get "/" do
  @books = Book.order(:id).all
  halt erb(:browse)
end

get "/author/:author" do
  author = params[:author]
  @book = Book.order(:author).where(author: author)
  halt erb(:search_results)
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