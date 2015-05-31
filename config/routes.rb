Bloccit::Application.routes.draw do

  devise_for :users
  resources :questions
  resources :posts
  resources :advertisements

  get 'about' => 'welcome#about'

root to: 'welcome#index'

  end

