Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sales#table'

  resources :sales, only: [:index] do
    collection do
      get :refresh
      get :table
    end
  end
end
