CollaborativeQandA::Application.routes.draw do
  devise_for :users

  resources :collaborations

  root :to => 'home#index'
end
