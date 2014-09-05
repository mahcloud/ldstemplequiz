Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources 'temples'
  resources 'photos'
  resources 'quiz'
  resources 'answers'

  get 'admin' => 'admin/temples#index', :as => 'admin_home'
  namespace :admin do
    resources :continents
    resources :countries
    resources :states
    resources :temples do
      resources :photos
    end
  end
end
