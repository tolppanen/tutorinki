Rails.application.routes.draw do
  get 'home/index'

  #devise_for :users
  devise_for :users, :controllers => { registrations: 'users/registrations' },
   path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', registrations: 'cmon_let_me_in' }
  #devise_for :users, :controllers => { registrations: 'registrations' }
	root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
