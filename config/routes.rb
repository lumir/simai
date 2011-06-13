Simai::Application.routes.draw do
  devise_for :users
  root :to => "home#index"
  match "/users/create" => "users#create", :as => :create_user
  match "/users/new" => "users#new", :as => :new_user
end
