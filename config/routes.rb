Rails.application.routes.draw do
  resources :profiles, except: [:new, :edit]
  post 'profiles/notify' => 'profiles#notify'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  resources :contacts
  resources :examples, except: [:new, :edit]
end
