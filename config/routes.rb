DogParks::Application.routes.draw do
  devise_for :users
  get  '/', :to => "site#index",    :as => "index"
  post '/', :to => "site#check_in", :as => "check_in"

  root :to => "site#index"
end
