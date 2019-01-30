Rails.application.routes.draw do

  devise_for :users
  root 'projects#index', as:'home'
  resources :projects, only: [:index, :show] do
    resources :tasks
  end
  namespace :admin do
    resources :projects, except: [:index, :show]
  end

end
