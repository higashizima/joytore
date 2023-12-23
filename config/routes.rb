Rails.application.routes.draw do

  root to: 'homes#top'
  
  devise_for :admins, skip: %i[registrations passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  # ゲストユーザーログイン用ルート
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#admin_guest_sign_in'
  end
  
  scope module: :public do
    resources :gyms, only:%i[index show] do
      resource :favorite_gyms, only: %i[create destroy] 
    end
    get 'users/:id', to: 'users#show', as: 'user'
    get 'user/profile', to:'users#edit'
    patch 'user/update', to:'users#update'
    resources :users, only: %i[] do
      resource :relationships, only: %i[create destroy]
      # ルート要編集
      get 'favorite_gyms', to:'favorite_gyms#index'
      get "followings", to: 'relationships#followings'
      get "followers", to: 'relationships#followers'
    end
    resources :training_records, only:%i[new show create destroy] do
      resources :post_comments, only: %i[create destroy]
      resource :likes, only: %i[create destroy]
    end
    get "search", to:"training_records#search"
  end
  
  namespace :admin do
    get 'top', to:'homes#top'
    resources :users, only:%i[index show update]
    resources :training_records, only:%i[show edit update]
    resources :gyms, only:%i[new create index show edit update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
