Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :conversations
  resources :messages
  namespace :api do
    namespace :v1 do
      # TODO: Make endpoint auth/users/sign_in
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :posts

      resources :subreddits, except: %i[update delete]

      resources :users
      resources :mail_sender
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
