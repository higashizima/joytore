Rails.application.routes.draw do
  root to: 'homes#top'
  
  devise_for :admins, skip: %i[registrations passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  scope module: :public do
    resources :gyms, only:%i[index show] do
      resource :favorite_gyms, only: %i[create destroy] 
    end
    get 'users/my_page', to: 'users#show'
    resources :users, only:%i[edit update] do
      get 'favorite_gyms', to:'favorite_gyms#index', on: :collection
    end
    resources :training_records, only:%i[new show create edit update] do
      resources :post_comments, only: %i[create destroy]
      resource :likes, only: %i[create destroy]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
