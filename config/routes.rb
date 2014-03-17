Bandera::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root :to => "home#index"
  resources :videos

end
