Bloccit::Application.routes.draw do
  resources :advertisements
  resources :posts

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"

    root to: 'welcome#index'

  end

