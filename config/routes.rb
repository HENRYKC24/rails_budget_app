Rails.application.routes.draw do
  # get 'user/index'
  devise_for :users
  # get 'one_transaction/index'
  # get 'one_transaction/create'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/create'
  # get 'splash/index'

  root 'users#index'

  resources :users, only: [:index] do
    resources :categories, only: [:index, :show, :new, :create] do
      resources :entities, only: [ :index, :new, :create]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
