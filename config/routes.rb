
Rails.application.routes.draw do

  get 'login/twitter' => 'sessions#twitter_auth'
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/whisper' => 'whisper#index'
  get '/whisper/tweets' => 'whisper#get_tweet', as: 'whisper_get_tweet'
  get '/whisper/tweets/:id' => 'whisper#tweet', as: 'whisper_tweet'
  get '/whisper/tweets/:id/stop' => 'whisper#stop'
  get '/whisper/tweets/:id/na' => 'whisper#na'
  get '/whisper/tweets/:id/:category' => 'whisper#category'
  get '/whisper/tweets/:id/:category/:subcategory' => 'whisper#subcategory'

  get 'dashboard' => 'www#dashboard', as: 'dashboard'
  get 'projects/litmus' => 'www#litmus'
  get 'projects/whisper' => 'www#whisper'
  get 'projects' => 'www#projects'

  resources :tweets do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'www#about'
  root :to => 'www#index'
end