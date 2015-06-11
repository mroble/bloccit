Bloccit::Application.routes.draw do

  devise_for :users
  resources :questions
  resources :topics do
  resources :posts, except: [:index]
   end

  

  get 'about' => 'welcome#about'
  resources :advertisements
  resources :posts

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"

  root to: 'welcome#index'

end

