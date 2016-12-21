Rails.application.routes.draw do
  get 'home/index'

  #devise_for :users
  devise_for :users, :controllers => { registrations: 'users/registrations' },
  path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', registrations: 'signup' }
  #devise_for :users, :controllers => { registrations: 'registrations' }
	root to: "home#index"
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers
  get 'teachers/:id' => 'teachers#show'
  get 'bio' => 'teachers#bio'
  post 'bio' => 'teachers#save'
  post 'teachers/:id' => 'teachers#save'
  get 'teachers' => 'teachers#index'
  get 'contacts' => 'teachers#contacts'
  get 'requests' => 'friendships#pending'
  get 'subjects/api' => 'skills#api'
  resources :friendships
  resources :chats, only: [:new, :create, :show, :index]
  get 'confirmation/:id' => 'friendships#confirm', :as => :confirm_friendship
  resources :skills, only: [:new, :create, :show, :destroy]

  mount ActionCable.server => '/cable'

end
