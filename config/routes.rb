Rails.application.routes.draw do
  resources :portfolios

  # what is in the parentheses after get is totally customizable
  get 'about', to: 'pages#about'
  get 'contact', to: "pages#contact"
  resources :blogs

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
