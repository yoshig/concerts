Concerts::Application.routes.draw do
  resources :users
  resources :concerts
  resources :sessions
  resources :bands do
    resources :tours
  end
end
