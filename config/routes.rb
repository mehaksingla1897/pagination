Rails.application.routes.draw do
  namespace :api do
    # get "user/create"
    # get "user/show"
    namespace :user do
      get "create"
      get "show"
      get "index" 
      get "typeahead"
    end
  end
end
