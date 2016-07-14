Rails.application.routes.draw do

  root to: 'home#index'
  get '/', to: 'home#index'
  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'

  get '/subreddits', to: 'subreddits#index', as: :subreddits

  get '/subreddits/:subreddit_name', to: 'subreddits#show', as: :subreddit
  get '/user', to: 'home#show', as: :user
end
