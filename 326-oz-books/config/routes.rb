App::Application.routes.draw do

get "/" => "main#index"

get "books/:id" => "main#books"

end
