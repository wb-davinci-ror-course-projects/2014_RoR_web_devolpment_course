App::Application.routes.draw do
  get  "/"          => redirect("/login")
  get  "/login"     => "main#login_get"
  post "/login"     => "main#login_post"
  get  "/followers" => "main#followers_get"
  post "/followers" => "main#followers_post"
  get  "/logout"    => "main#logout"
end
