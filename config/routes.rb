DogParks::Application.routes.draw do
  get  '/', :to => "site#index",    :as => "index"
  post '/', :to => "site#check_in", :as => "check_in"
end
