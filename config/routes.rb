Rails.application.routes.draw do
  
  root 'static_pages#top'

  devise_for :users, module: 'users', skip: [:passwords, :unlocks], controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  resources :users, only: [:index, :show, :destroy] do
    resources :tasks do
      member do
        patch 'update_cpl'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
