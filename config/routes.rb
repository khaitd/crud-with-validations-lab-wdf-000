Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :edit, :new, :create, :update, :destroy]
end
