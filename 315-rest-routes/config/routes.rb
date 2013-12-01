App::Application.routes.draw do
  get  "/"               => "main#root"

  get  "/list_ads"       => "main#list_ads"

  get  "/new_ad"         => "main#new_ad"
  post "/new_ad"         => "main#new_ad_post"

  get  "/show_ad/:id"    => "main#show_ad"

  get  "/edit_ad/:id"    => "main#edit_ad"
  post "/edit_ad/:id"    => "main#edit_ad_post"

  get  "/destroy_ad/:id" => "main#destroy_ad"
end
