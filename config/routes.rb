Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    collection do
      post '/login', to: 'users#login'
      post '/', to: 'users#signup'
    end
  end
  resources :verses, only: [:show, :update] do
    collection do
      get '/search/:version/:book/:chapter/:verse', to: 'verses#search'
    end
  end
end
