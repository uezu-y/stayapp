Rails.application.routes.draw do
  
  get 'users/index'
  root 'stays#index'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  devise_scope :user do
    get 'signin' => 'devise_token_auth/sessions#new'
    post 'signin' => 'devise_token_auth/sessions#create'
    post 'signup' => 'users#create'
    get "users/show" => "users#show"
  end
  resources :users , only: [:edit,:update]
  
  get "stays/insear" => "stays#insear"
  get "stays/index" => "stays#index"
  
  
  resources :reservations
  
  delete 'reservations/:id' => 'reservations#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :reservations, only:[:index, :new, :create, :destroy] do
    collection do
      post :confirm
    end
  end

  

  resources :stays, only: [:index, :new, :create, :show] do
    collection do
      
      get 'search'
      post 'search'
    
    end
  end
end


