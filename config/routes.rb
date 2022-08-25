Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders,only: [:new, :index, :show, :create]
    #post 'orders/confirm' => 'orders#confirm'
    #get 'orders/complete' => 'orders#complete'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create, ]
    #delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    #get 'cart_items' => 'cart_items#index'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
  end
  
  
  namespace :admin do
    resources :orders, only: [:show]
    get '/' => 'homes#top'
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :customers, only: [:index,:show,:edit,:update]
  end 
  
   
  devise_for :admin,skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
