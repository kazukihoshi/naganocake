Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'orders/show'
  end
  
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/complete'
  end
  
  namespace :public do
    get 'cart_items/index'
  end
  
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/edit'
  end
  
  namespace :public do
    get 'items/index'
    get 'items/show'
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
