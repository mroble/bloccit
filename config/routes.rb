Bloccit::Application.routes.draw do

  resources :question
  resources :posts
  resources :advertisements

  get 'about' => 'welcome#about'

root to: 'welcome#index'

  end

