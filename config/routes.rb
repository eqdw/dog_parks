DogParks::Application.routes.draw do
  get  '/', :to => "site#index"
  post '/', :to => "site#check_in"
end
