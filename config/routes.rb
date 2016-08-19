Rails.application.routes.draw do
  root 'dashboards#show'

  mount ActionCable.server => '/cable'

  resource :users, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resources :chatrooms, except: [:destroy, :edit] do
    resources :messages, except: [:destroy, :edit, :update]
  end
end
