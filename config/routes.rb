Rails.application.routes.draw do
  get 'projects/new'
  get 'projects/create'
  get 'projects/destroy'
  devise_for :users

  root to: 'pages#home'
  resources :projects, only: [:new, :create, :destroy] do
    member { get 'step1'}
    member { get 'step2'}
    member { get 'step3'}
    member { get 'ideas'}
    member { get 'votes'}
    member { get 'results'}
    resources :destinations, only: [:create]
    resources :activities, only: [:create]
    resources :moods, only: [:create, :update] do
      collection { get 'scenery'}
      collection { get 'lifestyle'}
      collection { get 'party'}
    end
  end
  resources :guests, only:[:update] do
    member { get 'preferences'}
  end

  resources :destinations do
    member { get 'upvote'}
  end

  resources :activities do
    member { get 'upvote'}
  end

  resources :activities do
    member do
      put "like", to: "activities#upvote"
      put "dislike", to: "activities#downvote"
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
