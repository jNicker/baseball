Rails.application.routes.draw do

  resources :runs

  resources :games

  resources :teams do
    collection do
      get 'top'
    end
  end

  resources :players do
    collection do
      get 'top'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
