App::Application.routes.draw do
  get "/" => redirect("/users")

  resources :users, only: ["index", "new", "create"]
  post "/users/login"  => "users#login",  as: "login"
  post "/users/logout" => "users#logout", as: "logout"

  get "/verify_email/:user_id/:token" => "users#verify_email",
    as: "verify_email"
  post "/resend_verification_email" => "users#resend_verification_email",
    as: "resend_verification_email"
  get "/email" => "users#email", as: "email"
  put "/send" => "users#send_email", as: "send_email"
  get "/reset/:user_id/:token"    => "users#reset", as: "reset_password"
  put "/reset"  => "users#reset_password", as: "reset_password1"
end
