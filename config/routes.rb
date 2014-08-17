Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources 'temples'
  resources 'photos'
  resources 'quiz'
  resources 'answers'
end
