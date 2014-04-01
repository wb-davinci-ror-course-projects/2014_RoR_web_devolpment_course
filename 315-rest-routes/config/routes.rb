App::Application.routes.draw do
  get  "/"               => "main#ads"

  get  "/ads"            => "main#ads"

  post "/ads"             => "main#create"
  
  get  "/ads/new"         => "main#new"
  
  get  "/ads/:id"        => "main#show"

  get  "/ads/:id/edit"    => "main#edit"
  put "/ads/:id"          => "main#update"

  delete  "/ads/:id"         => "main#destroy"
end
