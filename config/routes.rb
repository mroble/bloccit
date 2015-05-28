Bloccit::Application.routes.draw do

  resources :question
  resources :posts

  get 'about' => 'welcome#about'
  resources :advertisements
  resources :posts

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"

  root to: 'welcome#index'

end

