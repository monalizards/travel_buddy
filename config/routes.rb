Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'trips'
    end
  end

  resources :trips do
    member do
      get 'book'
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
