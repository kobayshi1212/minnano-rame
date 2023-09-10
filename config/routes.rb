Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'homes#top'
  get 'homes/about'
  
  get 'mypage' => 'users#mypage'
  resources :users, only:[:show,:edit,:update]
  resources :posts, only:[:new,:create,:show,:edit,:update,:destroy] do
    resource :favorites, only:[:create,:destroy]
    recources :post_comments, only:[:create,:dest]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
