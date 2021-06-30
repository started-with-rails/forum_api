Rails.application.routes.draw do
  resources :questions do
    resources :answers do
      member do
        get :upvote
        get :downvote
      end
    end
  end
  resources :users, only: :create
  resources :categories, only: [:index] do
   member do
    get :questions
   end
  end
  post 'authenticate', to: 'authentication#authenticate'
  get  'authorize_token', to: 'authentication#authorize_token'
  match '*path', :to => 'application#invalid_route', :via => :all
end
