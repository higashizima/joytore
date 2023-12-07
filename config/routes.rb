Rails.application.routes.draw do
  root to: 'homes#top'
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  scope module: :public do
    get 'users/my_page', to: 'users#show'
    resources :users, only:[:edit, :update]
    get 'training_records/new'
    resources :training_records, only:[:create, :edit, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
