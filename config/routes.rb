DogParks::Application.routes.draw do
  devise_for :users
  get  '/', :to => "site#index",    :as => "index"
  post '/', :to => "site#check_in", :as => "check_in"

  get  '/about', :to => "site#about", :as => "about"

  get    '/profile',        :to => "site#profile",    :as => "profile"
  post   '/add_dog',        :to => "site#add_dog",    :as => "add_dog"
  delete '/remove_dog/:id', :to => "site#remove_dog", :as => "remove_dog"

  get    '/codes',          :to => "site#qr_codes",   :as => "codes"

  resources :dogs, :only => [:index, :show]

  root :to => "site#index"
end
