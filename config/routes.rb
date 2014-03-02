Concerts::Application.routes.draw do
  resources :users
  resources :concerts
  resources :sessions
  resources :bands do
    resources :tours, except: :index
  end
  resources :tours, except: :index do
    resources :concerts, only: [:create, :destroy]
    collection do
      get 'set_dates'
    end
  end
end
