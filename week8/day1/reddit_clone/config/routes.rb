Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :index, :create] do 
    resources :subs, only: [:edit]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:new, :index, :show, :create, :update] do
    resources :posts, only: [:new, :create, :edit]
  end
  resources :posts, except: [:index, :new, :create, :edit]
end
