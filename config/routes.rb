Rails.application.routes.draw do

  root to: 'home#index'
  get '/', to: 'home#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
end
