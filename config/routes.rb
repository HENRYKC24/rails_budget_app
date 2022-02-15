Rails.application.routes.draw do
  get 'one_transaction/index'
  get 'one_transaction/create'
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'splash/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
