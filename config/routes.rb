Rails.application.routes.draw do

  get 'notifications/index'
  root to: 'homes#top'
  get 'homes/about'
  get 'mypage' => 'users#mypage'
  get 'rank' => "ranks#rank"
  get 'search' => "searches#search"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only:[:show, :edit, :update] do
    resource :relationships, only:[:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :favorites
    end
  end
  
  
  resources :posts, only:[:new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end
  
  resource :notifications, only:[:index, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
