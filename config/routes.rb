Rails.application.routes.draw do
  resource :signup, only: %i[create]
  resources :authentications, only: %i[create]
  resources :users, only: [:index, :update]
  get 'users/activities/:id', action: :user_activities, controller: 'users'

end
