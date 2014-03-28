App::Application.routes.draw do

get "/" => "main#index"
get "show" => "main#show"
post "show" => "main#show_post"
post "new_leader" => "main#new_leader"
get "logout" => "main#logout"

end
