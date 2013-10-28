CollaborativeQandA::Application.routes.draw do
  devise_for :users

  resources :collaborations
  resources :users
  resources :collaboration do
    member do
      put "create/:user_id", action: :create, as: :create
    end
  end
  resources :user do
    member do
      put "create/:collaboration_id", action: :create, as: :create
    end
  end

  root :to => 'home#index'
end
