App::Application.routes.draw do
  get  "/"               => "ads#root",            as: "root1"

  get  "/list_ads"       => "ads#list_ads",        as: "list_ads1"

  get  "/new_ad"         => "ads#new_ad",          as: "new_ad1"
  post "/new_ad"         => "ads#new_ad_post",     as: "new_ad_post"
  
  get  "/show_ad/:id"    => "ads#show_ad",        as: "show_ad1"

  get  "/edit_ad/:id"    => "ads#edit_ad",         as: "edit_ad1"
  post "/edit_ad/:id"    => "ads#edit_ad_post",    as: "edit_ad_post"

  get  "/destroy_ad/:id" => "ads#destroy_ad",      as: "destroy_ad1"
end
