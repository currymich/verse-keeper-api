Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes, only: [:show, :update, :destroy, :create]
  resources :users, only: [:show] do
    collection do
      post '/login', to: 'users#login'
      post '/', to: 'users#signup'
    end
  end
  resources :verses, only: [:destroy] do
    collection do
      post '/save', to: 'verses#save'
      get '/search/:version/:book/:chapter/:verse', to: 'verses#search_verse'
      get '/search/:version/:book/:chapter', to: 'verses#search_chap'
      get '/votd', to: 'verses#votd'
    end
  end
  get '/user/:id/verses', to: 'verses#user_verses'
  get '/verse/:id/notes', to: 'notes#verse_notes'
end
