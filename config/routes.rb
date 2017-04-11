Rails.application.routes.draw do
  root "static_page#home"

  namespace :admin do
    resources :categories
    resources :lessons

  end
end
