CollaborativeQandA::Application.routes.draw do
  resources :collaborations

  root :to => 'home#index'
end
