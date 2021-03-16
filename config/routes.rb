Rails.application.routes.draw do
  resources :questions do
    resources :answers do
      member do
        get :upvote
        get :downvote
      end
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  match '*path', :to => 'application#invalid_route', :via => :all
end
