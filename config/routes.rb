Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chefs, only: :show do
    resources :dishes, only: [:create, :show]
    resources :ingredients, only: :index, controller: ""
  end 


end
