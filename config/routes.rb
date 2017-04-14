Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "admin/categories#index"

  namespace :admin do
    resources :categories
    resources :lessons
    resources :grammars
    resources :kanjis
    resources :lesson_kanjis
    resources :videos

  end
end
