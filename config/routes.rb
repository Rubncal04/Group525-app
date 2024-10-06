Rails.application.routes.draw do
  resources :contacts do
    collection do
      get :get_states
      get :get_cities
      get :download_file
    end
  end
end
