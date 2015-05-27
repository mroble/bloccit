Bloccit::Application.routes.draw do
<<<<<<< HEAD
  resources :posts

  get 'about' => 'welcome#about'

=======
  resources :advertisements
  resources :posts

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
>>>>>>> chckpt-27-assignment

    root to: 'welcome#index'

  end

