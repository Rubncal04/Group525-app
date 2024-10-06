Rails.application.routes.draw do
  resources :contacts do
    collection do
      get :get_states
      get :get_cities
    end
  end
end
