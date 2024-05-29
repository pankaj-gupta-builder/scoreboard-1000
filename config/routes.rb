Rails.application.routes.draw do
  resources :games do
    member do
      post :add_players
    end

    resources :rounds
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :players
end
