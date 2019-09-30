Rails.application.routes.draw do
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  resources :programs
  resources :book_histories
  resources :books
  resources :libraries
  scope "/admin" do
  	resources :students
  end
  resources :librarians
  resources :universities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
