Bandera::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  #devise_scope :user do
  #  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

  root :to => "home#index"
  resources :videos
  get 'pages/about' => "pages#about"
  get 'location/get' => "locations#show"
end
