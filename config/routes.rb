Rails.application.routes.draw do
  get 'trips/index'
  get 'trips/show'
  get 'trips/new'
  get 'trips/edit'
  get 'trips/create'
  get 'trips/update'
  get 'trips/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'trips'
    end
  end
  resources :trips

end
