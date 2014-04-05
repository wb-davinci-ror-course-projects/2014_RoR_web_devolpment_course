App::Application.routes.draw do
  get  "/"         => "main#root"
  get  "/login"    => "main#login",       as: "login_page"
  post "/login"    => "main#login_post",  as: "login_create"
  get  "/accounts" => "main#accounts",    as: "accounts1"
  get  "/location" => "main#location",    as: "location1"
  get  "/rates"    => "main#rates",       as: "rates1"
  get  "/logout"   => "main#logout",      as: "logout1"
end
