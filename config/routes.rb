Rails.application.routes.draw do

  resources :orders do
   member do
     post :pay_with_alipay
     post :pay_with_wechat
   end
 end

 namespace :account do
   resources :orders
 end

 resources :carts do
     collection do
       delete :clean
        post :checkout
     end
  end

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
   resources :products
   resources :orders
     member do
       patch :move_up
       patch :move_down
     end
   end
 end

 devise_for :users
 root 'products#index'





end
