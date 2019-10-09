Rails.application.routes.draw do
  get 'sessions/new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
