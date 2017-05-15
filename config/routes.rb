Rails.application.routes.draw do

  get 'comments/new'

  devise_for :users
  resources :users , only: [:show] do
    get 'plans'
  end
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  scope 'e9MsLOs/admin', as: 'staff',module: 'admin' do
    get  'member' => 'staffs#member'
    get  'log' => 'staffs#log'
    get  'repassword' => 'staffs#repassword'
    patch 'repassword' => 'staffs#repassword'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    resources :plans
    resources :users
    resources :comments
  end
  resources :staffs, path: 'e9MsLOs/admin' , controller: 'admin/staffs'

  resources :plans
  resource :goods, only:[:create, :destroy]


end
