Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :tags, only: [:create,:show]
  post 'authenticate', to: 'authentication#authenticate'
  match '*path', :to => 'application#invalid_route', :via => :all
end
