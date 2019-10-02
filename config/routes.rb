
Rails.application.routes.draw do
  root :to => 'universities#index' 

  resources :programs
  resources :book_histories
  resources :books
  resources :libraries
  resources :students
  resources :librarians
  resources :universities
end
