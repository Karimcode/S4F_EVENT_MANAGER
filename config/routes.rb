Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/testux' => 'pages#testux'
  resources :users

end
