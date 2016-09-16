Recipes2::Application.routes.draw do
  resources :recipes
  root "recipes#index"
end
