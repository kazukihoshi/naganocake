Rails.application.routes.draw do
  
    root to:'homes#top'
    get 'about' => 'homes#about'
    resources :orders,only: [:new, :index, :show, :create]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all]
    get 'cart_items' => 'cart_items#index'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  
  
  namespace :admin do
    resources :orders, only: [:show]
    get 'admin' => 'homes#top'
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
  end 
  
   
  devise_for :admins,skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }
  
  devise_for :customers,skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
