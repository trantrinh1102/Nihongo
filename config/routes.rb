Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "static_page#home"

  namespace :admin do
    resources :categories
    resources :lessons
    resources :grammars
    resources :kanjis
    resources :lesson_kanjis
    resources :videos
    resources :vocabularies
    resources :tests
    resources :questions
  end
end
