App::Application.routes.draw do
  get "/"               => "things#root"
  get "/ads"            => "things#index"
  get "/show/:id"       => "things#show"

  get  "/tasking"      => "tasking#index"
  post "/tasking"      => "tasking#create"
  get  "/tasking/logout" => "tasking#logout"

  get  "/changes"                  => "changes#index"
  get  "/changes/new"              => "changes#new"
  post "/changes"                  => "changes#create"
  get  "/changes/:id/edit"         => "changes#edit"  
  put "/changes/:id"               => "changes#update"
  delete  "/changes/:id"           => "changes#destroy"
end

