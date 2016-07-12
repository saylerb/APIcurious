Rails.application.routes.draw do

  get '/', to: 'home#index'

  get '/auth/reddit', as: :reddit_login

end
