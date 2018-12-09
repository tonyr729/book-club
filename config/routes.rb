Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, shallow: true, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy] do
      resources :users, only: [:show]
    end
  end
	resources :authors, only: [:show, :destroy]
end
