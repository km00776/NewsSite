Rails.application.routes.draw do
  get 'trending/rank'

  devise_for :users
  resources :articles do
    resources :reviews
  end
  root 'articles#index'


  get 'a1', to: 'articles#a1'
  get 'a2', to: 'articles#a2'
  get 'a3', to: 'articles#a3'
  get 'a4', to: 'articles#a4'
  get 'a5', to: 'articles#a5'




end
