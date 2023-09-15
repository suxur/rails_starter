Rails.application.routes.draw do
  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end
  root to: redirect("/users/sign_in")

  devise_for :users

  resource :dashboard, only: :show, controller: "dashboard"
end
