Simai::Application.routes.draw do
  devise_for :users
  root :to => "home#index"
  match "/users/index" => "users#index", :as => :index_user
  match "/users/show" => "users#show", :as => :show_user
  match "/users/create" => "users#create", :as => :create_user
  match "/users/new" => "users#new", :as => :new_user
  match "/users/:id/edit" => "users#edit", :as => :edit_user
  match "/users/:id/update" => "users#update", :as => :update_user
  match "/users/:id/destroy" => "users#destroy", :as => :destroy_user
end
