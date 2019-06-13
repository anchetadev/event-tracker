Rails.application.routes.draw do
  get 'events/create'

  # get 'events/show'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'events/show'

  get 'sessions/new'
  resources :users
  get 'users/new' => 'users#new'
  post 'events/new' => 'events#create'
  get 'events/:id' => 'events#join'
  get 'event/:id' => 'events#show'
  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  get 'users/:id' => 'users#show'
  patch  '/users/:id/edit' => 'users#update'

end
