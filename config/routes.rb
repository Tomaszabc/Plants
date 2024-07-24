Rails.application.routes.draw do
  get 'water_reminders/new'
  get 'water_reminders/create'
  devise_for :users
  resources :plants do
    resources :water_reminders, only: [:new, :create]
    member do
      post 'water'
    end
  end

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root "plants#index"
end
