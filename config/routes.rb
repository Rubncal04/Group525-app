Rails.application.routes.draw do
  root to: 'contacts#index'

  resources :contacts, except: [:index] do
    collection do
      get :get_states
      get :get_cities
      get :download_file
    end
  end
end
