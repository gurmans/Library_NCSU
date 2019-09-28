Rails.application.routes.draw do
  resources :students
  resources :librarians
  resources :universities
  resources :book_histories
  resources :books
  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
